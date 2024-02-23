//
//  MedicineProviderView.swift
//  DawaaiSwiftUi
//
//  Created by user3 on 23/02/24.
//

import SwiftUI

struct MedicineProviderView: View {
    @Binding var isPresented: Bool
    @State private var selectedProviders = [false, false, false, false, false, false]

    var body: some View {
        ZStack{
            NavigationView {
                List {
                    Toggle("Tata1mg", isOn: $selectedProviders[0])
                    Toggle("Apollo 24/7", isOn: $selectedProviders[1])
                    Toggle("NetMeds", isOn: $selectedProviders[2])
                    Toggle("PharmEasy", isOn: $selectedProviders[3])
                    Toggle("MediBuddy", isOn: $selectedProviders[4])
                    Toggle("MedLife", isOn: $selectedProviders[5])
                }
                .navigationBarTitle(Text("Medicine Provider"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.isPresented = false
                }) {
                    Text("Done").bold()
                })
            }
        }.background(Color("bgColor"))
    }
}

struct ContentsView: View {
    @State private var showModal = false

    var body: some View {
        Button(action: {
            self.showModal.toggle()
        }) {
            Text("Show Modal")
        }
        .sheet(isPresented: $showModal) {
            MedicineProviderView(isPresented: self.$showModal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentsView()
    }
}
