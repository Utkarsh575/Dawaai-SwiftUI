//
//  FamilyLogView.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 21/02/24.
//

import Foundation
import SwiftUI


struct FamilyLogView : View {
    private var data :[Int] = Array(1...4)
    private var familyMembers: [FamilyMember] = [
        FamilyMember(id: 1, name: "Dad", image: "dad"),
        FamilyMember(id: 2, name: "Mom", image: "mom"),
        FamilyMember(id: 3, name: "Didi", image: "didi"),
    ]
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 170))]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: adaptiveColumns,spacing: 20){
                    ForEach(familyMembers){member in
                        ZStack{
                            Rectangle()
                                .frame(width: 170, height: 170)
                                .foregroundColor(.white)
                                .cornerRadius(30).shadow(radius: 10)
                            
                            VStack {
                                Image(member.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(width: 100, height: 100)
                                HStack{
                                    Text(member.name)
                                    Button(action: {
                                        guard let phoneNum = URL(string: "tel://1-123-456-7890") else { return }
                                        UIApplication.shared.open(phoneNum)
                                    }) {
                                        Text("Call number")
                                    }
                                    
                                }
                                
                               

                           
                            }
                        }
                    }
                    
    
                    
                }
                
            }.navigationTitle("Family Log").background(Color("bgColor"))
            
        }
    }
    
    struct FamilyMember: Identifiable {
        let id: Int
        let name: String
        let image: String // Name of the image file or URL
    }
}
    
    #Preview {
        ContentView()
    }

