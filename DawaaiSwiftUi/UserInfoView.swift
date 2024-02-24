//
//  UserInfoView.swift
//  DawaaiSwiftUi
//
//  Created by user3 on 24/02/24.
//

import SwiftUI

struct UserInfoView: View {
    
    @State var nameTitle : String = "Name"
    @State var ageTitle : String = "Age"
    @State var genderTitle : String = "Gender"
    @State var bloodTitle : String = "Blood Group"
    
    @State var name : String = ""
    @State var age : String = ""
    @State var gender : String = ""
    @State var blood : String = ""
    
    var body: some View {
        ZStack {
            Color("bgColor")
                .ignoresSafeArea()
            VStack{
                Text("Please Enter your Details").font(.title).fontWeight(.bold).padding(.bottom,42)
                VStack(spacing:16.0){
                    InputFieldView(data: $name, title: nameTitle)
                    InputFieldView(data: $age, title: ageTitle)
                    InputFieldView(data: $gender, title: genderTitle)
                    InputFieldView(data: $blood, title: bloodTitle)
                    Button(action: {}) {
                        Text("Done")
                            .fontWeight(.heavy)
                            .font(.title3)
                            .frame(width:300)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("boColor"))
                        .cornerRadius(40)}}
            }
        }
    }
}

#Preview {
    UserInfoView()
}
