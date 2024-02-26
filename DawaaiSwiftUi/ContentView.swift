//
//  ContentView.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 10/01/24.
//

import SwiftUI

struct Medicine : Decodable , Identifiable {
    var id : Int
    var name : String
    var type : String
    var strength : String
    var strengthUnit : String
    var Image : String
    var taken : Int
    var toBeTake : Int
    var nextDoseTime : Date
    var dosageType : String
    var dosage : Int
    var quantity : Int
    var expiryDate : Date
    var startDate : Date
    var remindForReorder : Bool
    var breakfast : Bool
    var lunch : Bool
    var dinner : Bool
    
}

struct ContentView : View {
//    init() {
//        UITabBar.appearance().backgroundColor = UIColor(Color.pickerSelected)
//        }
    @State public var TotalMedicines : [Medicine] = [
        Medicine(id: 1, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true
),
            
        Medicine(id: 2, name: "Amodep AT", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true
),

            
        Medicine(id: 3, name: "Amyron", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true
),

            
        Medicine(id: 4, name: "Cinarest", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true
),

        
    
]

    var body: some View {
        TabView{
            
            HomeView(medicineCtas: TotalMedicines.filter({ Medicine in
                Medicine.expiryDate > Date()
            })
            ).tabItem { Label("Home", systemImage: "house")
            }
            AddMedicineView(medicineCards:  $TotalMedicines).tabItem {                     Label("Meds", systemImage: "pill")
            }
            FamilyLogView().tabItem {                     Label("Family log", systemImage: "person.3")
            }
            HistoryView(medicineCards: $TotalMedicines).tabItem {                     Label("History", systemImage: "calendar.badge.clock")
            }

        }.accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).toolbarBackground(
            Color("bgColor"),
            for: .tabBar)
    }
}


