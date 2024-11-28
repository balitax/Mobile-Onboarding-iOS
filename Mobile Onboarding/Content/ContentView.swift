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
                ForEach(0..<viewModel.sections.count, id:\.self) { index in
                    Section(viewModel.sections[index].title) {
                        onboardingPage(index: index)
                    }
                }
            }
            .toolbar {
                Toggle(isOn: $isDark) { }
                .toggleStyle(.switch)
            }
        }
    }
    
    @ViewBuilder
    func onboardingPage(index: Int) -> some View {
        ForEach(0..<viewModel.sections[index].pages.count, id:\.self) { indexPage in
            Button {
                viewModel.onTapButtonNavigation(index: index, indexPage: indexPage)
            } label: {
                HStack {
                    Text(viewModel.sections[index].pages[indexPage].title)
                        .tint(.primary)
                        .font(.system(size: 14, weight: .regular))
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14))
                        .tint(.secondary)
                }
            }
            .fullScreenCover(isPresented: $viewModel.sections[index].pages[indexPage].isPresent) {
                viewModel.sections[index].pages[indexPage].presentView()
            }
            .navigationDestination(isPresented: $viewModel.sections[index].pages[indexPage].isPush) {
                viewModel.sections[index].pages[indexPage].presentView()
            }
        }
    }
}

#Preview {
    ContentView()
}
