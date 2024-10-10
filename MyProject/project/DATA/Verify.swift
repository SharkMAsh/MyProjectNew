//
//  Verify.swift
//  MyProject
//
//  Created by user on 10.10.2024.
//

import SwiftUI

struct OTPVerify: View {
    
    @State var c0: String = ""
    @State var c1: String = ""
    @State var c2: String = ""
    @State var c3: String = ""
    @State var c4: String = ""
    @State var c5: String = ""
    @State var allFieldsContains: Bool = false
    
    @State var isCurrentCode: Bool = false
    
    @State var defaultColor = Color.blue
    
    @State var v0State: Bool = false
    @State var v1State: Bool = false
    @State var v2State: Bool = false
    @State var v3State: Bool = false
    @State var v4State: Bool = false
    @State var v5State: Bool = false
    
    func checkFields() {
        
        if c0.isEmpty || c1.isEmpty || c2.isEmpty || c3.isEmpty || c4.isEmpty || c5.isEmpty {
            allFieldsContains = false
        } else {
            allFieldsContains = true
        }
        
    }
    
    func currentCode() {
        var counterFields: Int = 0
        
        if c0 == "2" {
            counterFields += 1
        }
        
        if c1 == "2" {
            counterFields += 1
        }
        
        if c2 == "2" {
            counterFields += 1
        }
        
        if c3 == "2" {
            counterFields += 1
        }
        
        if c4 == "2" {
            counterFields += 1
        }
        
        if c5 == "2" {
            counterFields += 1
        }
        
        if counterFields == 6 {
            isCurrentCode = true
        } else {
            isCurrentCode = false
            defaultColor = Color.red
        }
    }
    
    var body: some View {
        
        VStack {
            
            Text("OTP Verification")
                .font(.system(size: 30, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 5)
                .padding(.top, 100)
            Text("Eter the 6 digit numbers send to your email")
                .font(.system(size: 14))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .foregroundColor(.gray)
                .padding(.bottom, 50)
            
            HStack(spacing: 25) {
                TextField("", text: $c0)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(v0State ? defaultColor : Color.gray)
                    .multilineTextAlignment(.center)
                    .onChange(of: c0) { newValue in
                        if c0.count > 1 {
                            self.c0 = String(newValue.prefix(1))
                        } else if c0.count < 1 {
                            self.v0State = false
                            self.defaultColor = Color.blue
                        } else {
                            self.v0State = true
                        }
                        checkFields()
                    }
                TextField("", text: $c1)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(v1State ? defaultColor : Color.gray)
                    .multilineTextAlignment(.center)
                    .onChange(of: c1) { newValue in
                        if c1.count > 1 {
                            self.c1 = String(newValue.prefix(1))
                        } else if c1.count < 1 {
                            self.v1State = false
                            self.defaultColor = Color.blue
                        } else {
                            self.v1State = true
                        }
                        checkFields()
                    }
                TextField("", text: $c2)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(v2State ? defaultColor : Color.gray)
                    .multilineTextAlignment(.center)
                    .onChange(of: c2) { newValue in
                        if c2.count > 1 {
                            self.c2 = String(newValue.prefix(1))
                        } else if c2.count < 1 {
                            self.v2State = false
                            self.defaultColor = Color.blue
                        } else {
                            self.v2State = true
                        }
                        checkFields()
                    }
                TextField("", text: $c3)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(v3State ? defaultColor : Color.gray)
                    .multilineTextAlignment(.center)
                    .onChange(of: c3) { newValue in
                        if c3.count > 1 {
                            self.c3 = String(newValue.prefix(1))
                        } else if c3.count < 1 {
                            self.v3State = false
                            self.defaultColor = Color.blue
                        } else {
                            self.v3State = true
                        }
                        checkFields()
                    }
                TextField("", text: $c4)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(v4State ? defaultColor : Color.gray)
                    .multilineTextAlignment(.center)
                    .onChange(of: c4) { newValue in
                        if c4.count > 1 {
                            self.c4 = String(newValue.prefix(1))
                        } else if c4.count < 1 {
                            self.v4State = false
                            self.defaultColor = Color.blue
                        } else {
                            self.v4State = true
                        }
                        checkFields()
                    }
                TextField("", text: $c5)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(v5State ? defaultColor : Color.gray)
                    .multilineTextAlignment(.center)
                    .onChange(of: c5) { newValue in
                        if c5.count > 1 {
                            self.c5 = String(newValue.prefix(1))
                        } else if c5.count < 1 {
                            self.v5State = false
                            self.defaultColor = Color.blue
                        } else {
                            self.v5State = true
                        }
                        checkFields()
                    }
            }
            
            Text("If you didn't receive code, resend after 1:00")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(25)
            
            NavigationLink(destination: SetNewPassword(),
                           isActive: $isCurrentCode) {
                EmptyView()
            }
            
            if !allFieldsContains {
                Text("Set New Password")
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(allFieldsContains ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .padding(.top, 50)
                    .foregroundColor(.white)
            } else {
                Button("Set New Password", action: {
                    currentCode()
                })
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(allFieldsContains ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .padding(.top, 50)
                    .foregroundColor(.white)
                
            }
            
            Spacer()
            
            Text("Default code: \(Text("222222").foregroundColor(.blue))")
                .font(.system(size: 12))
                .foregroundStyle(.gray)
        }
        .padding(25)
        .navigationBarBackButtonHidden(true)
    }
        
}
