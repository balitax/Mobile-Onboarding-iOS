//
//  InputEmailView.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 11/11/24.
//

import SwiftUI

struct InputEmailView: View {
    
    @State private var email = ""
    
    var body: some View {
        VStack {
            
            VStack(spacing: 16) {
                Text("What's your email?")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.primary)
                
                TextField("Email address", text: $email)
                    .textFieldStyle(.plain)
                    .frame(height: 54)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 28, weight: .medium))
            }
        }
        .padding(.horizontal)
        .padding(.top)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .bottom) {
            ButtonView(title: "Continue", style: .primary) { }
                .padding()
        }
        
    }
}

#Preview {
    InputEmailView()
}
