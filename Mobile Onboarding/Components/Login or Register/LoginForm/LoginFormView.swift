//
//  LoginFormView.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 11/11/24.
//

import SwiftUI

struct LoginFormView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Image("onboard1")
                .resizable()
                .frame(width: 180, height: 130)
            
            Text("Welcome back")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.primary)
                .padding(.top, 24)
            
            VStack(spacing: 16) {
                TextFieldView(text: .constant(""), placeholder: "Email")
                TextFieldView(text: .constant(""), placeholder: "Password")
                ButtonView(title: "Login", style: .primary) { dismiss() }
                ButtonView(title: "Forgot password?", style: .tertiary) { dismiss() }
            }
            .padding()
            
            Spacer()
            
        }
        .padding(.top, 26)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .overlay(alignment: .bottom) {
            ButtonView(title: "Create new account", style: .secondary) { dismiss() }
                .padding()
        }
    }
}

//#Preview {
//    LoginFormView()
//}
