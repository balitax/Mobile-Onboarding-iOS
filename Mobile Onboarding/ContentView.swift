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
            Button(viewModel.welcomes[index].title){
                viewModel.welcomes[index].isPresent.toggle()
            }.fullScreenCover(isPresented: $viewModel.welcomes[index].isPresent) {
                viewModel.welcomes[index].presentView()
            }
        }
    }
}

#Preview {
    ContentView()
}
