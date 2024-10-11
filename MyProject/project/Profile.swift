//
//  Profile.swift
//  MyProject
//
//  Created by user on 12.10.2024.
//

import SwiftUI

struct Profile: View {
    
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        
        VStack {
            Spacer()
           
            Text("Home")
                .font(.custom("Roboto-Regular", size: 24))
                .padding(10)
      
            Spacer()
            
        }
        
        
    }
}

#Preview {
    Profile()
}
