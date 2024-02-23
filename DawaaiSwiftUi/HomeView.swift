//
//  HomeView.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 21/02/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State private var showingMedicineInfo = false
    @State private var selectedMedicine : Medicine?

    public var medicineCtas : [Medicine]
    @State public var selectedDate = Date()

    @State private var searchText = ""
    
//    var filteredMedicines = medicineCtas.filter{ medicine in  medicine.expiryDate > Date()
//        
//    }

    var body: some View {
        NavigationStack{
            ScrollView{
                
                VStack{
                    Text("DAWAAI").font(.title).bold().padding(.trailing,225)
                    NavigationLink{
                        ProfileView()
                    } label: {
                        HStack{
                            VStack{
                                Text("Hello Ezio").font(.system(size: 30,weight: .semibold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .center).padding(.leading , 10);
                                Text("1 of 3 completed Today").font(.system(size: 15,weight: .light)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .center).padding(.leading, 15);
                            }
                            Image("heroImage").padding(.horizontal ,20)
                        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , alignment:.leading).background(Color("heroColor")).cornerRadius(25.0).shadow(color: .green,radius: 2).foregroundColor(.black)
                    }
                    
                    
                    //Hstack end
                }.frame(maxWidth: .infinity , maxHeight: .infinity , alignment: .center).padding(10).padding(.horizontal,10)
                
                Text("Your Meds for today").font(.system(size: 25 ,weight: .bold)).padding(.trailing, 140)
                DatePicker("", selection: $selectedDate, displayedComponents: .date).padding(.top ,-46).padding(.trailing,17)
                
                
                PlanpickerView(selectedDate : $selectedDate)
                
                ScrollView{
                    ForEach(medicineCtas) { med in
                        MedicineCta(medicine: med).onTapGesture {
                            selectedMedicine = med
                            showingMedicineInfo = true
                        }
                        
                    }
                }
                
                //            MedicineCta(medicine: medicineCtas[0])
                //            MedicineCta()
                //            MedicineCta()
                
            }.background(Color("bgColor"))        .sheet(isPresented: $showingMedicineInfo, content: {
                if let medicine = selectedMedicine {
                    MedicineInfo(medicine: medicine)
                        .presentationDetents([.fraction(1.0)]) // Adjustable modal height
                }
            })
            
        }
    }
}

struct MedicineCta : View {
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
            
            Text("\(medicine.taken)/\(medicine.toBeTake)").padding(.trailing,30).foregroundColor(.green)
        }.frame(maxWidth: 350 , alignment:.leading).background(Color.white).cornerRadius(15).shadow(radius: 3)
        
    }
}

struct PlanpickerView : View {
    @Binding public var selectedDate : Date

    @State private var dayToday = Calendar.current.component(.day, from: Date())

    func getPreviousDateDay(date: Date) -> String {
            let calendar = Calendar.current
            let yesterday = calendar.date(byAdding: .day, value: -1, to: date)!
            let day = calendar.component(.day, from: yesterday)
            return String(day)
        }

    func getNextDateDay(date: Date) -> String {
        let calendar = Calendar.current
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: date)!
        let day = calendar.component(.day, from: tomorrow)
        return String(day)
    }


    @State private var leftIsSelected = false
    @State private var midIsSelected = false
    @State private var rightIsSelected = false
    
    @State private var selectedCard : Int = 4;
        
    let today = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
    let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!

    
    var body: some View {
    
        HStack{
            
            VStack{
                Text("Mon").bold().padding(.top,10)
                Text("\(getPreviousDateDay(date:Date()))").font(.system(size: 45))
                Text("3 Meds").padding(.bottom,10)
                
            }.frame(maxWidth: 80 , alignment:.center).background(selectedCard == 0 || selectedDate == yesterday ? Color.pickerSelected : Color.white).cornerRadius(15).padding(.bottom,5).shadow( radius: 2).onTapGesture(perform: {
                selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
                selectedCard = 0;
            })

            
            VStack{
                Text("Mon").bold().padding(.top,10)
                Text("\(String(dayToday))").font(.system(size: 45))
                Text("5 meds").padding(.bottom,10)
                
            }.frame(maxWidth: 80 , alignment:.center).background(selectedCard == 1 ? Color.pickerSelected : Color.white).cornerRadius(15).shadow(radius: 3).padding(.bottom,5).padding(.horizontal ,30).foregroundColor(midIsSelected ? Color.white : Color.black).shadow(color: .pickerSelected, radius: 2).onTapGesture(perform: {
                selectedDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
                selectedCard = 1;

            })

            
            VStack{
                Text("Mon").bold().padding(.top,10)
                Text("\(getNextDateDay(date: Date()))").font(.system(size: 45))
                Text("3 meds").padding(.bottom,10)
                
            }.frame(maxWidth: 80 , alignment:.center).background(selectedCard == 2 ? Color.pickerSelected : Color.white).cornerRadius(15).padding(.bottom,5).shadow( radius: 2).onTapGesture(perform: {
                selectedDate = Calendar.current.date(byAdding: .day, value: +1, to: Date())!
                selectedCard = 2;
                
                
            })


        }.onAppear(perform: {
            if( !(selectedDate == today) || !(selectedDate == yesterday) || !(selectedDate == tomorrow)){
                selectedCard = 3;
            }else{
                selectedCard = 1;
            }

//            if(selectedDate == today){
//                midIsSelected = true;
//            }else{
//                midIsSelected = false;
//            }
//            if(selectedDate == tomorrow){
//                rightIsSelected = true;
//            }else{
//                rightIsSelected = false;
//            }
//            if(selectedDate == yesterday){
//                leftIsSelected = true;
//            }else{
//                leftIsSelected = false;
//            }
            
            
            }
        )
    }
}

// DATA MODELS



#Preview {
    ContentView()
}
