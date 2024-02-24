//
//  SignInView.swift
//  DawaaiSwiftUi
//
//  Created by user3 on 23/02/24.
//

import SwiftUI

struct SignInView: View {
    
    @State var usernameTitle : String = "Username"
    @State var passwordTitle : String = "Password"
    
    @State var username : String = ""
    @State var password : String = ""
    
    var body: some View {
        ZStack {
            Color("bgColor")
                .ignoresSafeArea()
            VStack{
                Text("Welcome Back !").font(.largeTitle).fontWeight(.bold).padding(.bottom,42)
                VStack(spacing:16.0){
                    InputFieldView(data: $username, title: usernameTitle)
                    InputFieldView(data: $password, title: passwordTitle)
                }.padding(.bottom,25)
                Button(action: {}) {
                    Text("Sign In")
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(width:300)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("boColor"))
                        .cornerRadius(40)
                }
                HStack {
                    Spacer().frame(maxWidth: 160)
                    Text("Forgot Password?")
                        .fontWeight(.light)
                        .foregroundColor(Color.blue)
                        .underline()
                }.padding(.top, 16)
                VStack{
                    Text(" or sign in with").font(.title3)
                    HStack{
                        Button(action: {
                                   
                               }) {
                                   Image("apple")
                                       .resizable()
                                       .aspectRatio(contentMode: .fit)
                                       .frame(width: 55, height: 55)
                                       .foregroundColor(.black)
                               }
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
               
//                VStack{
//                   
//                    Text("Don't have an account? Create one !")
//                }.frame(alignment: .bottom)
                
            }
        }
    }
}
#Preview {
    SignInView()
}
