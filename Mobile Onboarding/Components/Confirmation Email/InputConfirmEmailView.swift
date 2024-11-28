//
//  InputConfirmEmailView.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 28/11/24.
//

import SwiftUI

struct InputConfirmEmailView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                
                HStack {
                    Image(systemName: "paperplane")
                        .font(.system(size: 40))
                        .foregroundStyle(.secondary)
                    Spacer()
                }
                .padding(.top, 24)
                .padding(.horizontal)
                .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Confirm email")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.primary)
                    
                    Text(verbatim: "Enter the code sent to your email someone@mail.com")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 16) {
                    TextFieldView(text: .constant(""), placeholder: "Code")
                        .keyboardType(.numberPad)
                    
                    HStack(alignment: .firstTextBaseline, spacing: 4) {
                        Text("Didn't receive a code?")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(.secondary)
                        
                        Button {
                            
                        } label: {
                            Text("Send again")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(.blue)
                        }

                    }
                    
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .bottom) {
                ButtonView(title: "Continue", style: .primary) { }
                    .padding()
            }
        }
        
    }
}

#Preview {
    InputConfirmEmailView()
}
