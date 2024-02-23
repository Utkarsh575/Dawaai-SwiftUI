//
//  AddMedicineView.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 21/02/24.
//


    
//    = [
//        Medicine(id: 1, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill1", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000)),
//        Medicine(id: 2, name: "Amodep AT", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill2", taken: 1, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708599400), dosageType: "Before eating" ,dosage: 3, quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000)),
//        Medicine(id: 3, name: "Amyron", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill3", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708527400), dosageType: "Before eating",dosage: 3, quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000)),
//        Medicine(id: 4, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill3", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708527400), dosageType: "Before eating",dosage: 3, quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000)),
//        Medicine(id: 5, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill3", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708527400), dosageType: "Before eating",dosage: 3, quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000))
//]

    
import SwiftUI
import Foundation

struct AddMedicineView : View {
    
    @Binding public var medicineCards : [Medicine]
    @State private var selectedCard : Medicine?
    @State private var showingMedicineInfo : Bool = false
    @State private var showingAddMedicineForm : Bool = false

    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Text("My Medicine").font(.title).bold()
                    Spacer()
                    Button(action: {
                        showingAddMedicineForm = true
                    }) {
                        Image(systemName: "plus")
                            .padding()
                    }
                    .sheet(isPresented: $showingAddMedicineForm) {
                        AddMedicineForm(medicineCards: $medicineCards)
                    }
                }
                
                ForEach(medicineCards) { med in
                    MedicineCard(medicine: med).onTapGesture {
                        selectedCard = med
                        showingMedicineInfo = true
                    }
                }
            }.frame(maxWidth: .infinity , maxHeight: .infinity , alignment: .center).padding(10).padding(.horizontal,10)
        }
        .background(Color("bgColor"))
        .sheet(isPresented: $showingMedicineInfo, content: {
            if let medicine = selectedCard {
                MedicineInfo(medicine: medicine)
                    .presentationDetents([.fraction(1.0)]) // Adjustable modal height
            }
        })
    }
}


struct MedicineCard : View {
    let medicine : Medicine;
    
    func getTimeFromTimestamp(timestamp: Double) -> String {
            let date = Date(timeIntervalSince1970: timestamp)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .short // Adjust format as needed (e.g., .medium, .long)
            return dateFormatter.string(from: date)
        }

    var body: some View {
        HStack{
            Image(medicine.Image).padding(.leading ,20)

            VStack{
                Text(medicine.name).font(.system(size: 25,weight: .semibold)).frame(maxWidth: .infinity ,alignment : .leading).padding(.leading , 5);
                
                Text("\(getTimeFromTimestamp(timestamp:medicine.nextDoseTime.timeIntervalSince1970)) \(medicine.dosageType)").font(.system(size: 15,weight: .light)).frame(maxWidth: .infinity ,alignment : .leading).padding(.leading, 5);
            }.padding(20)
            
//            Text("\(medicine.taken)/\(medicine.toBeTake)").padding(.trailing,30).foregroundColor(.green)
            
        }.frame(maxWidth: 350 , alignment:.leading).background(Color.white).cornerRadius(15).shadow(radius: 3)
        
    }
}

//#Preview {
//    AddMedicineView()
//}
