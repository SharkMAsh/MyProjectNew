//
//  CheckBoxView.swift
//  MyProject
//
//  Created by user on 10.10.2024.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var isActive: Bool
    
    var body: some View {
        
        Group {
            if isActive {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.blue)
                    .frame(width: 16, height: 16)
                    .overlay {
                        if isActive {
                            Image(systemName: "checkmark")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                        }
                    }
            } else {
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.accentColor, lineWidth: 1)
                    .frame(width: 16, height: 16)
            }
        }
        .onTapGesture {
            self.isActive.toggle()
        }
        
    }
}

