//
//  InputFieldView.swift
//  DawaaiSwiftUi
//
//  Created by user3 on 23/02/24.
//

import SwiftUI

struct InputFieldView: View {
    
    @Binding var data:String
    var title: String?
    
    var body: some View {
        ZStack {
          TextField("", text: $data)
            .padding(.horizontal, 10)
            .frame(width: 360, height: 52)
            .overlay(
              RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                  .stroke(Color.gray, lineWidth: 1)
            )
          HStack {
            Text(title ?? "Input")
              .font(.headline)
              .fontWeight(.medium)
              .foregroundColor(Color.black)
              .multilineTextAlignment(.leading)
              .padding(4)
              .background(Color("bgColor"))
            Spacer()
          }
          .padding(.leading, 8)
          .offset(CGSize(width: 0, height: -20))
        }.padding(4)
    }
}

#Preview {
    InputFieldView(data: .constant(""))
}
