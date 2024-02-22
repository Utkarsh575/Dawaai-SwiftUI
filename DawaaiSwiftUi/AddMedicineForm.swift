//
//  AddMedicineForm.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 21/02/24.
//

import SwiftUI

struct AddMedicineForm: View {
    var body: some View {
        ScrollView{
            VStack{
                Text("My Medicine").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().padding(.leading,0.5)
                Text("Pill Name").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment:.leading)
            }.frame(maxWidth: .infinity , maxHeight: .infinity , alignment: .leading).padding(.leading)
        }.background(Color("bgColor"))
       
        
    }
}

#Preview {
    AddMedicineForm()
}
