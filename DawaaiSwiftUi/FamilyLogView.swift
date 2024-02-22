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
        FamilyMember(id: 1, name: "Dad", image: "dad" , status: 1 , memberHisotry: [        Medicine(id: 1, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill1", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000)),
                                                                                            Medicine(id: 2, name: "Amodep AT", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill2", taken: 1, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708599400), dosageType: "Before eating" ,dosage: 3, quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000)),
                                                                                            Medicine(id: 3, name: "Amyron", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill3", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708527400), dosageType: "Before eating",dosage: 3, quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000)),
                                                                                            Medicine(id: 4, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill3", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708527400), dosageType: "Before eating",dosage: 3, quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000)),
                                                                                            Medicine(id: 5, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill3", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708527400), dosageType: "Before eating",dosage: 3, quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000))
]),
        FamilyMember(id: 2, name: "Mom", image: "mom" , status: 0 , memberHisotry: [        Medicine(id: 1, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill1", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000)),
                                                                                            Medicine(id: 2, name: "Amodep AT", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill2", taken: 1, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708599400), dosageType: "Before eating" ,dosage: 3, quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000)),
                                                                                            Medicine(id: 3, name: "Amyron", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill3", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708527400), dosageType: "Before eating",dosage: 3, quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000)),
                                                                                            Medicine(id: 4, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill3", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708527400), dosageType: "Before eating",dosage: 3, quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000)),
                                                                                            Medicine(id: 5, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill3", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708527400), dosageType: "Before eating",dosage: 3, quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000))
]),
        FamilyMember(id: 3, name: "Didi", image: "didi" , status: 1 , memberHisotry: [        Medicine(id: 1, name: "Dola 650", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill1", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000)),
                                                                                              Medicine(id: 2, name: "Amodep AT", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill2", taken: 1, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708599400), dosageType: "Before eating" ,dosage: 3, quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000)),
                                                                                              Medicine(id: 3, name: "Amyron", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill3", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708527400), dosageType: "Before eating",dosage: 3, quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000)),
                                                                                              Medicine(id: 4, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill3", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708527400), dosageType: "Before eating",dosage: 3, quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000)),
                                                                                              Medicine(id: 5, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", frequency: "daily", Image: "pill3", taken: 2, toBeTake: 3, nextDoseTime: Date(timeIntervalSince1970: 1708527400), dosageType: "Before eating",dosage: 3, quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000))
]),
    ]
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 170))]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                Text("Family Log").font(.system(size: 25 , weight: .bold))
                LazyVGrid(columns: adaptiveColumns,spacing: 20){
                    ForEach(familyMembers){member in
                        NavigationLink{
                            MemberHistoryView(currMember: member)
                        } label: {
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
                                        
                                        if(member.status == 1 ){
                                            Image(
                                                systemName: "checkmark.circle.fill").foregroundColor(.green)
                                        }else{
                                            Image(
                                                systemName: "bell").foregroundColor(.red)
                                        }
                                        
                                        
                                        
                                        Text(member.name).padding(.horizontal , 10)
                                        Button(action: {
                                            guard let phoneNum = URL(string: "tel://1-123-456-7890") else { return }
                                            UIApplication.shared.open(phoneNum)
                                        }) {
                                            Image(systemName: "phone.fill")
                                        }
                                        
                                    }
                                    
                                   

                               
                                }
                            }
                        }
                    }
                    
    
                    
                }
                
            }.background(Color("bgColor")).navigationBarTitle("Family Log", displayMode: .inline).navigationBarHidden(true)
            
        }.frame(maxWidth: .infinity , maxHeight: .infinity, alignment: .top)
    }
    

}
struct FamilyMember: Identifiable, Decodable {
    let id: Int
    let name: String
    let image: String // Name of the image file or URL
    let status : Int
    let memberHisotry : [Medicine]
}
    
    #Preview {
        FamilyLogView()
    }

