//
//  LoginOrRegisterBottomSheetView.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 10/11/24.
//

import SwiftUI

struct LoginOrRegisterBottomSheetView: View {
    
    @State var isPresentLoginOrRegisterBottomSheet: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            ACButtonView(title: "Sign In") {
                isPresentLoginOrRegisterBottomSheet.toggle()
            }
        }
        .padding()
        .onAppear {
            isPresentLoginOrRegisterBottomSheet.toggle()
        }
        .sheet(isPresented: $isPresentLoginOrRegisterBottomSheet) {
            bottomSheetLoginRegister()
                .presentationDetents([.fraction(0.6)])
                .interactiveDismissDisabled()
                .presentationCornerRadius(16)
        }
    }
    
    @ViewBuilder
    func bottomSheetLoginRegister() -> some View {
        VStack {
            
            HStack {
                Spacer()
                Button(action: {
                    isPresentLoginOrRegisterBottomSheet.toggle()
                }) {
                    ZStack {
                        Circle()
                            .fill(Color(UIColor.secondarySystemBackground))
                            .frame(width: 30, height: 30)
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .foregroundStyle(.gray)
                            .fontWeight(.bold)
                            .frame(width: 10, height: 10)
                    }
                }
            }
            .padding()
            .padding(.bottom, 8)
            
            VStack(spacing: 8) {
                Text("Login or sign up")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.primary)
                
                Text("Please select your preferred method\nto continue setting up your account")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal)
            
            VStack(spacing: 12) {
                ACButtonView(title: "Continue with Email", style: .primary, action: { })
                ACButtonView(title: "Continue with Phone", style: .secondary, action: { })
                
                HStack {
                    ACButtonIconView(icon: "googleIcon", style: .secondary, action: { })
                    ACButtonIconView(icon: "appleIcon", style: .secondary, action: { })
                }
            }
            .padding(.top, 32)
            .padding(.horizontal)
            .padding(.bottom, 34)
            
            VStack {
                Text(.init("If you are creating a new account,\n__Terms & Conditions__ and __Privacy Policy__ will apply."))
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
        }
    }
}

#Preview {
    LoginOrRegisterBottomSheetView()
}
