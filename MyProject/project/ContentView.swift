//
//  ContentView.swift
//  MyProject
//
//  Created by user on 12.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var confirmPassword: String = ""
    @State var checkBoxValue: Bool = false
    @State var allFieldsChecked: Bool = false
    @State private var showingAlert = false
    
    @StateObject var userViewModel = UserViewModel()
    
    func checkAllFields() {
        if !userViewModel.users.fullname.isEmpty && !userViewModel.users.phone.isEmpty && !userViewModel.users.email.isEmpty && checkBoxValue && !userViewModel.users.password.isEmpty && !confirmPassword.isEmpty {
            self.allFieldsChecked = true
        } else {
            self.allFieldsChecked = false
        }
    }
    
    func checkPassword() {
        if userViewModel.users.password.isEmpty || userViewModel.users.password != confirmPassword {
            self.showingAlert = true
            self.allFieldsChecked = false
        }
    }
    
    var body: some View {
        NavigationView {
            VStack{
                VStack {
                    Text("Create an acoount")
                        .font(.system(size: 30, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                    Text("Complete the sign up proccess to get started")
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
                }
                .padding(25)
                
                if userViewModel.isError {
                    ZStack {
                        Text("Проверьте правильность заполненных данных")
                            .font(.system(size: 12))
                            .foregroundStyle(.red)
                            .padding(10)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.red))
                            .padding(.top, -20)
                            .padding([.leading, .trailing], 25)
                    }
                }
                
                VStack(spacing: 20) {
                    TextFieldView(
                        isSecureField: false,
                        titleField: "Full name",
                        placeholderField: "Ivan Ivanov",
                        text: $userViewModel.users.fullname
                    )
                    .onChange(of: userViewModel.users.fullname) {
                        checkAllFields()
                    }
                    TextFieldView(
                        isSecureField: false,
                        titleField: "Phone number",
                        placeholderField: "+7 (999) 999-99-99",
                        text: $userViewModel.users.phone
                    )
                    .onChange(of: userViewModel.users.phone) {
                        checkAllFields()
                    }
                    TextFieldView(
                        isSecureField: false,
                        titleField: "Email address",
                        placeholderField: "***********@mail.com",
                        text: $userViewModel.users.email
                    )
                    .textContentType(.emailAddress)
                    .onChange(of: userViewModel.users.email) {
                        checkAllFields()
                    }
                    TextFieldView(
                        isSecureField: true,
                        titleField: "Password",
                        placeholderField: "***********",
                        text: $userViewModel.users.password
                    )
                    .onChange(of: userViewModel.users.password) {
                        checkAllFields()
                    }
                    TextFieldView(
                        isSecureField: true,
                        titleField: "Confirm password",
                        placeholderField: "***********",
                        text: $confirmPassword
                    )
                    .onChange(of: confirmPassword) {
                        checkAllFields()
                    }
                }
                .padding(5)
                .padding([.leading, .trailing], 20)
                HStack(spacing: 15) {
                    CheckBoxView(isActive: $checkBoxValue)
                        .onChange(of: checkBoxValue) {
                            checkAllFields()
                        }
                    Text("By ticking this box, you agree to our \(Text("Terms and conditions and private policy").foregroundColor(.yellow))")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .frame(width: .infinity, height: 50)
                        .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                }
                .padding([.top, .bottom], 15)
                
                NavigationLink(destination: LogIn(),
                               isActive: $userViewModel.isNavigate) {
                    EmptyView()
                }
                if allFieldsChecked {
                    
                    Button("Sign Up", action: {
                        userViewModel.signUp()
                    })
                        .font(.system(size: 16, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .frame(width: .infinity, height: 50)
                        .background(allFieldsChecked ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 25)
                        .foregroundColor(.white)
                } else {
                    Button("Sign Up", action: {
                        checkPassword()
                    })
                        .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text("Пароли не совпадают"),
                                message: Text("Убедитесь, что пароли введены верно"),
                                dismissButton: .default(Text("OK"))
                            )
                        }
                        .font(.system(size: 16, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .frame(width: .infinity, height: 50)
                        .background(allFieldsChecked ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 25)
                        .foregroundColor(.white)
                }
                
                VStack {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        NavigationLink("Sign In", destination: LogIn())
                            .font(.system(size: 14))
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
            .padding(5)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    ContentView()
}
