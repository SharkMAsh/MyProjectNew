//
//  SetNewPassword.swift
//  MyProject
//
//  Created by user on 12.10.2024.
//

import SwiftUI

struct SetNewPassword: View {
    
    @State var password: String = ""
    @State var passwordConfigrm: String = ""
    @State var checkPassword: Bool = false
    
    func passwordMatch() {
        if !password.isEmpty && password == passwordConfigrm {
            checkPassword = true
        } else {
            checkPassword = false
        }
    }
    
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        
        VStack {
            Text("New Password")
                .font(.custom("Roboto-Medium", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 5)
                .padding(.top, 100)
            Text("Eter new password")
                .font(.custom("Roboto-Medium", size: 14))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .foregroundColor(.myGray)
                .padding(.bottom, 50)
            
            VStack(spacing: 25) {
                TextFieldView(
                    isSecureField: true,
                    titleField: "Password",
                    placeholderField: "***********",
                    text: $password
                )
                .onChange(of: password) {
                    passwordMatch()
                }
                
                TextFieldView(
                    isSecureField: true,
                    titleField: "Confirm Password",
                    placeholderField: "***********",
                    text: $passwordConfigrm
                )
                .onChange(of: passwordConfigrm) {
                    passwordMatch()
                }
            }
            
            
            if !checkPassword {
                Text("Log In")
                    .font(.custom("Roboto-Medium", size: 16))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(checkPassword ? Color.myBlue : Color.myGray)
                    .cornerRadius(4)
                    .padding(.top, 50)
                    .foregroundColor(.white)
            } else {
                NavigationLink("Log In", destination: Profile())
                    .font(.custom("Roboto-Medium", size: 16))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(checkPassword ? Color.myBlue : Color.myGray)
                    .cornerRadius(4)
                    .padding(.top, 50)
                    .foregroundColor(.white)
            }
            
            Spacer()
        }
        .padding(25)
        .navigationBarBackButtonHidden(true)
        
        
    }
}
#Preview {
    SetNewPassword()
}
