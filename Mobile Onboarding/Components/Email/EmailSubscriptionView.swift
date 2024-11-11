//
//  EmailSubscriptionView.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 11/11/24.
//

import SwiftUI

struct EmailSubscriptionView: View {
    
    @State private var isSelected = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("@")
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundStyle(.gray.opacity(0.3))
                    Spacer()
                }
                .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Get going with email")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.primary)
                    Text("It’s helpful to provide a good reason for why the email address is required.")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(.secondary)
                }
                
                VStack(alignment: .leading, spacing: 24) {
                    TextFieldView(text: .constant(""), placeholder: "Email address")
                        .keyboardType(.emailAddress)
                    
                    HStack(spacing: 4) {
                        CheckBox(isChecked: $isSelected)
                        Text("Stay up to date with the latest news and resources delivered directly to your inbox")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(.secondary)
                    }
                    
                }
                .padding(.top, 24)
                
                Spacer()
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
}

//#Preview {
//    EmailSubscriptionView()
//}
