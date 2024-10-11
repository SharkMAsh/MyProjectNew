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
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 5)
                    .padding(.top, 100)
                Text("Fill in your email and password to continue")
                    .font(.system(size: 14))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .foregroundColor(.gray)
                
                if userViewModel.isError {
                    Text("Неверный логин или пароль")
                        .font(.system(size: 14))
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
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        NavigationLink("Forgot Password?", destination: ForgotPassword())
                            .font(.system(size: 14))
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        
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
                        .font(.system(size: 16, weight: .bold))
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                        .background(logInActive ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                } else {
                    Text("Log In")
                        .font(.system(size: 16, weight: .bold))
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                        .background(logInActive ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                
                VStack {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        NavigationLink("Sign Up", destination: ContentView())
                            .font(.system(size: 14))
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                    .padding([.top, .bottom], 5)
                    HStack(spacing: 5) {
                        Text("or log is using")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
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
