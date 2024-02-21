//
//  ContentView.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 10/01/24.
//

import SwiftUI



struct ContentView : View {
//    init() {
//        UITabBar.appearance().backgroundColor = UIColor(Color.pickerSelected)
//        }

    var body: some View {
        TabView{
            
            HomeView().tabItem { Label("Home", systemImage: "house")
            }
            AddMedicineView().tabItem {                     Label("Meds", systemImage: "pill")
            }
            FamilyLogView().tabItem {                     Label("Family log", systemImage: "person.3")
            }
            HistoryView().tabItem {                     Label("History", systemImage: "calendar.badge.clock")
            }

        }.accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).toolbarBackground(
            Color("bgColor"),
            for: .tabBar)
    }
}


