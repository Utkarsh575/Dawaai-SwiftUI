//
//  AddFamilyForm.swift
//  DawaaiSwiftUi
//
//  Created by user3 on 22/02/24.
//

import SwiftUI

struct AddFamilyForm: View {
    @State private var memberCode: String = ""

    var body: some View {
        ScrollView {
            VStack {
                Text("Add Member")
                    .font(.title)
                    .bold()
                    .padding(.leading, 20)
                
                
                Text("Enter Family Member's Code")
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding(.top, 100)
                  .padding(.horizontal,20)

                TextField("Type here", text: $memberCode)
                    .padding(.horizontal)
                    .padding(.top,10)
                    .frame(maxWidth: .infinity)
                    .textFieldStyle(.roundedBorder)
                    .cornerRadius(50)

                Spacer()
                Spacer()

                Button("Add Member") {
                    print("Member code entered!")
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(8)
                .font(.system(size: 20, weight: .bold))
                .padding(.leading) // Add leading padding to entire VStack
                
//                VStack {
//                    Text("Instructions")
//                        .padding(.horizontal) // Move text 20 points to the left
//
//                    HStack {
//                        Image(systemName: "bulletpoint.circle")
//                            .foregroundColor(.green)
//                            .font(.system(size: 16))
//                            .frame(width: 20) // Offset bullet point to the left
//                        Text("1) Ask the family member to share their unique profile ID.")
//                            .font(.system(size: 18))
//                    }
//                    .padding(.horizontal, 20) // Indent content
//
//                    HStack {
//                        Image(systemName: "bulletpoint.circle")
//                            .foregroundColor(.green)
//                            .font(.system(size: 16))
//                            .frame(width: 20) // Offset bullet point to the left
//                        Text("2) Enter the unique profile ID and tap Add Member.")
//                            .font(.system(size: 18))
//                    }
//                    .padding(.horizontal, 20) // Indent content
//
//                    Spacer()
//                }
        
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.leading)
            .font(.system(size: 24))
            .bold()
        }
        .background(Color("bgColor"))
        
    }
}


#Preview {
    AddFamilyForm()
}

