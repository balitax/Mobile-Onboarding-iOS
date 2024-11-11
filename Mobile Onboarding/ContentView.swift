//
//  ContentView.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 08/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var viewModel = ContentViewModel()
    @State var isDark = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Welcome Onboarding") {
                    welcomeOnboarding()
                }
                Section("Login or Register") {
                    loginRegisterOnboarding()
                }
                Section("Email Form") {
                    emailOnboarding()
                }
            }
            .navigationTitle("Mobile Onboarding")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Picker("Color Appearance Mode", selection: $isDark) {
                        Text("Light").tag(false)
                        Text("Dark").tag(true)
                    }
                    .pickerStyle(.segmented)
                    
                }
            }
        }
    }
    
    @ViewBuilder
    func welcomeOnboarding() -> some View {
        ForEach(0..<viewModel.welcomes.count, id:\.self) { index in
            Button(action: {
                viewModel.welcomes[index].isPresent.toggle()
            }) {
                HStack {
                    Text(viewModel.welcomes[index].title)
                        .tint(.primary)
                        .font(.system(size: 14, weight: .regular))
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14))
                        .tint(.secondary)
                }
            }.fullScreenCover(isPresented: $viewModel.welcomes[index].isPresent) {
                viewModel.welcomes[index].presentView()
            }
        }
    }

    @ViewBuilder
    func loginRegisterOnboarding() -> some View {
        ForEach(0..<viewModel.loginOrRegister.count, id:\.self) { index in
            Button(action: {
                viewModel.loginOrRegister[index].isPresent.toggle()
            }) {
                
                HStack {
                    Text(viewModel.loginOrRegister[index].title)
                        .tint(.primary)
                        .font(.system(size: 14, weight: .regular))
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14))
                        .tint(.secondary)
                }
            }.fullScreenCover(isPresented: $viewModel.loginOrRegister[index].isPresent) {
                viewModel.loginOrRegister[index].presentView()
            }
        }
    }
    
    @ViewBuilder
    func emailOnboarding() -> some View {
        ForEach(0..<viewModel.emails.count, id:\.self) { index in
            NavigationLink {
                viewModel.emails[index].presentView()
            } label: {
                Text(viewModel.emails[index].title)
                    .tint(.primary)
                    .font(.system(size: 14, weight: .regular))
            }
        }
    }
    
}

#Preview {
    ContentView()
}
