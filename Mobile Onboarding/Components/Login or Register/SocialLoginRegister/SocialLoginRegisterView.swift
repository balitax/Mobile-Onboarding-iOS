//
//  SocialLoginRegisterView.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 11/11/24.
//

import SwiftUI

struct SocialLoginRegisterView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            Image("onboard1")
                .resizable()
                .frame(width: 180, height: 130)
            
            Text("Login or sign up")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.primary)
                .padding(.top, 24)
            
            VStack(spacing: 16) {
                FillButton(title: "Continue with Apple", icon: "appleIcon", style: .secondary) { dismiss() }
                FillButton(title: "Continue with Google", icon: "googleIcon", style: .secondary) { dismiss() }
                FillButton(title: "Continue with Facebook", icon: "fbIcon", style: .secondary) { dismiss() }
            }
            .padding()
            
            VStack {
                HStack(spacing: 8) {
                    Rectangle()
                        .fill(.gray.opacity(0.4))
                        .frame(width: .infinity, height: 1)
                    
                    Text("Or")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.primary)
                    
                    Rectangle()
                        .fill(.gray.opacity(0.4))
                        .frame(width: .infinity, height: 1)
                    
                }
            }
            .padding(.horizontal)
            
            VStack(spacing: 16) {
                TextFieldView(text: .constant(""), placeholder: "Email address")
                FillButton(title: "Continue with Email") { dismiss() }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .overlay(alignment: .bottom) {
            VStack {
                Group(content: {
                    Text(.init("If you are creating a new account,\n")) +
                    Text.init("[Terms & Conditions](https://google.com)").underline() +
                    Text(.init(" & ")) +
                    Text.init("[Privacy Policy](https://google.com)").underline() +
                    Text(.init(" will apply."))
                })
                    .accentColor(.secondary)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    SocialLoginRegisterView()
}
