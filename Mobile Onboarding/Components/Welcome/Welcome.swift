//
//  Welcome.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 08/11/24.
//

import SwiftUI

struct Welcome: View {
    
    @State var viewModel = WelcomeViewModel()

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Spacer()
                
                VStack {
                    
                    // Content Pager
                    createViewPager()
                    
                    // Pager Indicator
                    VStack {
                        HStack {
                            ForEach(0..<viewModel.data.count, id: \.self) { index in
                                Circle()
                                    .fill(viewModel.currentStep == index ? Color.blue : Color.gray)
                                    .frame(width: 8, height: 8)
                            }
                        }
                        .padding(.top, 24)
                        .padding(.bottom, 64)
                    }
                    .background(.clear, in: RoundedRectangle(cornerRadius: 30))
                    .frame(width: 60)
                    
                    // Button
                    ACButtonView(title: viewModel.currentStep == viewModel.data.count - 1 ? "Continue" : "Get Started", action: {
                        withAnimation {
                            if viewModel.currentStep < viewModel.data.count - 1 {
                                viewModel.currentStep += 1
                            }
                        }
                    })
                }
                
            }
            .padding(.vertical)
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    func createViewPager() -> some View {
        TabView(selection: $viewModel.currentStep.animation()) {
            ForEach(0..<viewModel.data.count, id: \.self) { index in
                VStack(spacing: 8) {
                    Text(viewModel.data[index].title)
                        .foregroundStyle(Color.primary)
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: .infinity, alignment: .center)
                    
                    Text(viewModel.data[index].subTitle)
                        .foregroundStyle(Color.secondary)
                        .font(.system(size: 15, weight: .regular))
                        .frame(width: 300, alignment: .center)
                        .lineLimit(3)
                        .multilineTextAlignment(.center)
                }
                .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 80)
    }
    
}

#Preview {
    Welcome()
}
