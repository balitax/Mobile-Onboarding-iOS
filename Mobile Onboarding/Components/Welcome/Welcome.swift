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
        VStack {
            
            Spacer()
            
            // Pager View
            TabView(selection: $viewModel.currentStep) {
                ForEach(0..<viewModel.data.count, id: \.self) { index in
                    VStack(spacing: 8) {
                        
                        Image(viewModel.data[index].image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: .infinity, height: 210)
                            .padding(.bottom, 60)
                        
                        Text(viewModel.data[index].title)
                            .foregroundStyle(Color.primary)
                            .font(.system(size: 24, weight: .bold))
                            .frame(width: .infinity, alignment: .center)
                            .lineLimit(2)
                        
                        Text(viewModel.data[index].subTitle)
                            .foregroundStyle(Color.secondary)
                            .font(.system(size: 15, weight: .regular))
                            .frame(width: 300, alignment: .center)
                            .lineLimit(3)
                            .multilineTextAlignment(.center)
                        
                    }
                    .padding(.top, 190)
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: .infinity)
            
            // Pager Indicator
            VStack {
                HStack {
                    ForEach(0..<viewModel.data.count, id: \.self) { index in
                        Circle()
                            .fill(viewModel.currentStep == index ? Color.blue : Color.gray)
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.bottom, 64)
            }
            .frame(width: 60)
            
            // Button
            ACButtonView(title: viewModel.currentStep == viewModel.data.count - 1 ? "Mulai" : "Lanjut", action: {
                withAnimation {
                    if viewModel.currentStep < viewModel.data.count - 1 {
                        viewModel.currentStep += 1
                    }
                }
            })
            
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func createPage() -> some View {
        ZStack {
            VStack {
                Spacer()
                Spacer()
                
                VStack {
                    
                    // Content Pager
                    createViewPager()
                    
                    
                    
                    
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
                    
                    Image(viewModel.data[index].image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: .infinity, height: 210)
                    
                    Text(viewModel.data[index].title)
                        .foregroundStyle(Color.primary)
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: .infinity, alignment: .center)
                        .lineLimit(2)
                    
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
        .frame(height: UIScreen.main.bounds.height * 0.4)
    }
    
}

#Preview {
    Welcome()
}
