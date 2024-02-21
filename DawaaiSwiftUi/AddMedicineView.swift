//
//  AddMedicineView.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 21/02/24.
//

import SwiftUI
import Foundation

struct AddMedicineView : View {
    var body: some View {
        ScrollView{
            
            VStack{
                HStack{
                    Image(systemName:"search.fill")
                    
                    
                }.padding([.trailing],300)
                
                
                Text("Add Medicine")
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: .infinity , alignment: .center).padding(10).padding(.horizontal,10)
            

        }.background(Color("bgColor"))

    }
}

