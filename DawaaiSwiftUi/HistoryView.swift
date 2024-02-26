//
//  HistoryView.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 21/02/24.
//
/*import SwiftUI
import Foundation
struct HistoryView: View {
    @State private var tileData: [String] = ["Dolo 650", "Amyron", "Amodep AT", "Crocin", "Disprin", "Burnol"]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(minimum: 200))]) {
                    ForEach(tileData, id: \.self) { title in
                        TileView(title: title)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("HISTORY")
            .background(Color("bgColor"))
        }
    }
}

struct TileView: View {
    let title: String

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)

            VStack {
                // Optionally add an image here if needed
                // Image("imageName")
                //     .resizable()
                //     .aspectRatio(contentMode: .fit)
                //     .clipShape(RoundedRectangle(cornerRadius: 10)) // Match corner radius

                Text(title)
                    .font(.title3)
                    .multilineTextAlignment(.center) // Center align multi-line text

                // Add more content as needed
            }
            .padding(20) // Adjust padding if necessary
        }
        .frame(maxWidth: .infinity) // Ensure tiles expand to fill the width
    }
}

#Preview {
    ContentView()
}
*/

import SwiftUI
import Foundation

struct HistoryView : View {
    
    @Binding public var medicineCards : [Medicine]
    @State private var selectedCard : Medicine?
    @State private var showingMedicineInfo : Bool = false
    @State private var showingAddMedicineForm : Bool = false

    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
//                    HStack{
//                        Text("History").font(.title).bold()
//                    }
                    
                    ForEach(medicineCards) { med in
                        MedicineCard(medicine: med).onTapGesture {
                            selectedCard = med
                            showingMedicineInfo = true
                        }
                    }
                }.frame(maxWidth: .infinity , maxHeight: .infinity , alignment: .center).padding(10).padding(.horizontal,10)
            }
            .navigationTitle("History")
            .background(Color("bgColor"))
            .sheet(isPresented: $showingMedicineInfo, content: {
                if let medicine = selectedCard {
                    MedicineInfo(medicine: medicine)
                        .presentationDetents([.fraction(1.0)]) // Adjustable modal height
                }
            })
        }
    }
}


struct TileView : View {
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
