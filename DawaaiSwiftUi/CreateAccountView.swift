//
//  CreateAccountView.swift
//  DawaaiSwiftUi
//
//  Created by user3 on 24/02/24.
//

import SwiftUI

struct CreateAccountView: View {
    
    @State var userNameTitle : String = "Username"
    @State var passwordTitle : String = "Password"
    @State var emailTitle : String = "Email"
    @State var phoneTitle : String = "Phone Number"
    
    @State var userName : String = ""
    @State var password : String = ""
    @State var email : String = ""
    @State var phone : String = ""
    
    var body: some View {
        ZStack {
        Color("bgColor")
        .ignoresSafeArea()
            VStack{
                Text("Create Account").font(.largeTitle).fontWeight(.bold).padding(.bottom,42)
                VStack(spacing:16.0){
                    InputFieldView(data: $userName, title: userNameTitle)
                    InputFieldView(data: $email, title: emailTitle)
                    InputFieldView(data: $phone, title: phoneTitle)
                    InputFieldView(data: $password, title: passwordTitle)
                    Button(action: {}) {
                        Text("Create Account")
                            .fontWeight(.heavy)
                            .font(.title3)
                            .frame(width:300)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("boColor"))
                        .cornerRadius(40)}
                    VStack{
                        Text("or continue with").font(.title3)
                        HStack{
                            Button(action: {
                                       
                                   }) {
                                       Image("apple")
                                           .resizable()
                                           .aspectRatio(contentMode: .fit)
                                           .frame(width: 55, height: 55)
                                           .foregroundColor(.black)
                                   }/*.navigationLink(destination:UserInfoView())*/
                                   .padding(.horizontal)
                            Button(action: {
                                       
                                   }) {
                                       Image("google")
                                           .resizable()
                                           .aspectRatio(contentMode: .fit)
                                           .frame(width: 55, height: 55)
                                           .foregroundColor(.black)
                                   }
                                   .padding(.horizontal)
                            
                            
                        }
                    }.padding(.top,30)
                }.padding(.bottom,25)
            }
        }
    }
}

#Preview {
    CreateAccountView()
}
