//
//  ForgotPassword.swift
//  MyProject
//
//  Created by user on 10.10.2024.
//

import SwiftUI

struct ForgotPassword: View {
    
    @State var email: String = ""
    @State var currectField: Bool = false
    @State var isWarningEmail: Bool = false
    @State var isCurrentEmail: Bool = false
    
    func checkEmailAddress() {
        if email.contains("@") {
            isWarningEmail = false
            isCurrentEmail = true
        } else {
            isWarningEmail = true
            isCurrentEmail = false
        }
    }
    
    var body: some View {
        
        VStack {
            
            Text("Forgot Password")
                .font(.system(size: 30, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 5)
                .padding(.top, 100)
            Text("Enter your email address")
                .font(.system(size: 14))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .foregroundColor(.gray)
                .padding(.bottom, 50)
            
            if isWarningEmail {
                Text("Неверный формат электронной почты")
                    .font(.system(size: 14))
                    .foregroundStyle(.yellow)
                    .padding(10)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.yellow))
                    .padding(.top, -40)
                    .padding(.bottom, 5)
            }
            
            TextFieldView(
                isSecureField: false,
                titleField: "Email Address",
                placeholderField: "***********@example.com",
                text: $email
            )
            .textContentType(.emailAddress)
            .onChange(of: email) {
                if email.isEmpty {
                    self.currectField = false
                } else {
                    self.currectField = true
                }
            }
            
            NavigationLink(
                destination: OTPVerify(),
                isActive: $isCurrentEmail) {
                    EmptyView()
                }
            
            if email.isEmpty {
                Text("Send OTP")
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(currectField ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .padding(.top, 50)
                    .foregroundColor(.white)
            } else {
                Button("Send OTP", action: {
                    checkEmailAddress()
                })
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(currectField ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .padding(.top, 50)
                    .foregroundColor(.white)
            }
            
            
            HStack(spacing: 5) {
                Text("Remember password? Back to")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                NavigationLink("Sign In", destination: LogIn())
                    .font(.system(size: 14))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            
            Spacer()
        }
        .padding(25)
        .navigationBarBackButtonHidden(true)
        
    }
}


#Preview {
    ForgotPassword()
}
