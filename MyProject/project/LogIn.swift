//
//  LoginScreen.swift
//  MyProject
//
//  Created by user on 12.10.2024.
//

import SwiftUI

struct LogIn: View {
    
    @State var logInActive: Bool = false
    @State var checkBoxValue: Bool = false
    
    @StateObject var userViewModel = UserViewModel()
    
    func checkFields() {
        if !userViewModel.users.email.isEmpty && !userViewModel.users.password.isEmpty {
            logInActive = true
        } else {
            logInActive = false
        }
    }
    
    var body: some View {
        
            
            VStack {
                
                Text("Welcome Back")
                    .font(.custom("Roboto-Medium", size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 5)
                    .padding(.top, 100)
                Text("Fill in your email and password to continue")
                    .font(.custom("Roboto-Medium", size: 14))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .foregroundColor(Color.myGray)
                
                if userViewModel.isError {
                    Text("Неверный логин или пароль")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundStyle(.red)
                        .padding(10)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding(0)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.red))
                        .padding(.bottom, -15)
                    
                }
                
                VStack(spacing: 25) {
                    TextFieldView(
                        isSecureField: false,
                        titleField: "Email address",
                        placeholderField: "***********@example.com",
                        text: $userViewModel.users.email
                    )
                    .textContentType(.emailAddress)
                    .onChange(of: userViewModel.users.email) {
                        checkFields()
                    }
                    TextFieldView(
                        isSecureField: true,
                        titleField: "Password",
                        placeholderField: "***********",
                        text: $userViewModel.users.password
                    )
                    .onChange(of: userViewModel.users.password) {
                        checkFields()
                    }
                    HStack {
                        HStack {
                            CheckBoxView(isActive: $checkBoxValue)
                            Text("Remember password")
                                .font(.custom("Roboto-Medium", size: 12))
                                .foregroundColor(Color.myGray)
                        }
                        Spacer()
                        NavigationLink("Forgot Password?", destination: ForgotPassword())
                            .font(.custom("Roboto-Medium", size: 12))
                            .foregroundColor(.myBlue)
                        
                    }
                    .padding(.top, -5)
                }
                .padding([.top, .bottom], 25)
                
                Spacer()
                
                NavigationLink(destination: Profile(),
                               isActive: $userViewModel.isAuth) {
                    EmptyView()
                }
                if logInActive {
                    Button("Log In", action: {
                        userViewModel.signIn()
                    })
                        .font(.custom("Roboto-Medium", size: 16))
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                        .background(logInActive ? Color.myBlue : Color.myGray)
                        .cornerRadius(4)
                        .foregroundColor(.white)
                } else {
                    Text("Log In")
                        .font(.custom("Roboto-Medium", size: 16))
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                        .background(logInActive ? Color.myBlue : Color.myGray)
                        .cornerRadius(4)
                        .foregroundColor(.white)
                }
                
                VStack {
                    HStack {
                        Text("Already have an account?")
                            .font(.custom("Roboto-Regular", size: 14))
                            .foregroundColor(.myGray)
                        
                        NavigationLink("Sign Up", destination: ContentView())
                            .font(.custom("Roboto-Medium", size: 14))
                            .foregroundColor(.myBlue)
                    }
                    .padding([.top, .bottom], 5)
                    HStack(spacing: 5) {
                        Text("or log is using")
                            .font(.custom("Roboto-Regular", size: 14))
                            .foregroundColor(.myGray)
                        
                        Image(systemName: "g.circle.fill")
                            .font(.system(size: 16))
                            .foregroundColor(.orange)
                    }
                }
                
            }
            .padding(25)
            .navigationBarBackButtonHidden(true)
        
        
    }
}

#Preview {
    LogIn()
}
