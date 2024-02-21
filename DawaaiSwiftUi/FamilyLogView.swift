//
//  FamilyLogView.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 21/02/24.
//

import Foundation
import SwiftUI


struct FamilyLogView : View {
    var body: some View {
        ScrollView{
            
            VStack{
                HStack{
                    Image(systemName:"search.fill")
                    
                    
                }.padding([.trailing],300)
                
                Text("Family log")
                
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: .infinity , alignment: .center).padding(10).padding(.horizontal,10)
            

        }.background(Color("bgColor"))
    }
}
