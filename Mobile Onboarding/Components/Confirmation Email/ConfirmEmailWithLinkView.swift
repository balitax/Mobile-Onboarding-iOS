//
//  ConfirmEmailWithLinkView.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 28/11/24.
//

import SwiftUI

struct ConfirmEmailWithLinkView: View {
    var body: some View {
        VStack {
            
            Image(systemName: "paperplane")
                .font(.system(size: 60))
                .foregroundStyle(.secondary)
            
            VStack(alignment: .center, spacing: 8) {
                Text("Confirm your email address")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.primary)
                
                Text("Check your inbox and tap the link\nin the email we've just sent to:")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.secondary)
                
                Text(verbatim: "someone@mail.com")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.primary)
            }
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .bottom) {
            ButtonView(title: "Open email app", style: .primary) {
                openMailApp()
            }
            .padding()
        }
    }
    
    private func openMailApp() {
        let email = "agus.c@icloud.com"
        if let url = URL(string: "mailto:\(email)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}

#Preview {
    ConfirmEmailWithLinkView()
}
