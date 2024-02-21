//
//  MedicineInfo.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 21/02/24.
//

import Foundation
import SwiftUI

struct MedicineInfo : View {
    let medicine : Medicine
    
    func getTimeFromTimestamp(timestamp: Double) -> String {
            let date = Date(timeIntervalSince1970: timestamp)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .short // Adjust format as needed (e.g., .medium, .long)
            return dateFormatter.string(from: date)
        }

    func timestampToDateString(timestamp: Double, outputFormat: String = "dd/MM/yy") -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = outputFormat // Set custom format
        return dateFormatter.string(from: date)
    }

    var body: some View {
        ScrollView{
            
            VStack{
                
                Text(medicine.name)
                
                HStack{
                    Image("dolo650").padding(.horizontal ,20)
                    VStack{
                        
                        Text("Pill name").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                        

                        Text(medicine.name).font(.system(size: 30,weight: .semibold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                        
                        
                        Text("Pill dosage").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                        

                        Text(String(medicine.dosage)).font(.system(size: 30,weight: .semibold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                        
                        Text("Next reminder").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                        

                        Text(getTimeFromTimestamp(timestamp: medicine.nextDoseTime.timeIntervalSince1970)).font(.system(size: 25,weight: .semibold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);

                        
             
                        
                        
                    }.padding(.top,20).padding(.bottom , 20)
             
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , alignment:.center).background(Color("heroColor")).border(Color.green , width: 4 ).cornerRadius(25.0).shadow(radius: 3)                
                
                
                Text("Dosage timing").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 5)

                Text(getTimeFromTimestamp(timestamp: medicine.nextDoseTime.timeIntervalSince1970)).font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5)
               
                Text("Quantity").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 5)


                Text("Total \(String(medicine.quantity)) remain").font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                
                
                Text("Expiry Date").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 5)


                Text(timestampToDateString(timestamp: medicine.expiryDate.timeIntervalSince1970)).font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                
                
                
                Text("Dosage Instruction").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 5)


                Text(medicine.dosageType).font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);



                

                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: .infinity , alignment: .center).padding(10).padding(.horizontal,10)
            

        }.background(Color("bgColor"))

    }
}
