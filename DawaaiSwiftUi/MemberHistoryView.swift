//
//  MemberHistoryView.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 22/02/24.
//

import SwiftUI

struct MemberHistoryView: View {
    @State public var currMember : FamilyMember
    @State private var selectedCard : Medicine?
    @State private var showingMedicineInfo : Bool = false
    var body: some View {
        
        
        NavigationStack{
            ScrollView{
                HStack{
                    Text("\(currMember.name)'s Hisotry").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
//                            NavigationLink{
//                                AddMedicineForm()
//                            } label: {
//                                Image(systemName: "plus")
//                                    .padding()
//                            }
//
                    
                }

                    VStack{
                                                
                    
                        ForEach(currMember.memberHisotry) { med in
                        MedicineCard(medicine: med).onTapGesture {
                            selectedCard = med
                            showingMedicineInfo = true
                        }
                        
                    }

                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: .infinity , alignment: .center).padding(10).padding(.horizontal,10)
                

            }.background(Color("bgColor")).sheet(isPresented: $showingMedicineInfo, content: {
                if let medicine = selectedCard {
                    MedicineInfo(medicine: medicine)
                        .presentationDetents([.fraction(1.0)]) // Adjustable modal height
                }
            })
        }
    }
}

//#Preview {
//    MemberHistoryView()
//}
