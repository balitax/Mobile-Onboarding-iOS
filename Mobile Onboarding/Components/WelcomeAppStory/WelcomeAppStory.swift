//
//  WelcomeAppStory.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 08/11/24.
//

import SwiftUI

struct WelcomeAppStory: View {
    
    @State var viewModel = WelcomeAppStoryViewModel()
    
    var body: some View {
        ZStack {
            TabView(selection: $viewModel.selection) {
                ForEach(0..<viewModel.story.count, id:\.self) { index in
                    buildStoryPage(data: viewModel.story[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .overlay(alignment: .top, content: {
            buildPagerFrame()
                .padding()
        })
        .overlay(alignment: .bottom) {
            VStack {
                HStack {
                    ACButtonView(title: "Log In", style: .secondary, action: { })
                    ACButtonView(title: "Sign Up", style: .primary, action: { })
                }
            }
            .padding()
        }
        .onReceive(viewModel.timer, perform: { _ in
            withAnimation{
                viewModel.selection = viewModel.selection < 3 ? viewModel.selection + 1 : 0
            }
        })
    }
    
    @ViewBuilder func buildStoryPage(data: WelcomeAppStoryViewModel.WelcomeModel) -> some View {
        VStack(spacing: 8) {
            
            Spacer()
            
            Text(data.title)
                .foregroundStyle(Color.primary)
                .font(.system(size: 24, weight: .bold))
                .frame(width: .infinity, alignment: .center)
                .lineLimit(2)
            
            Text(data.subTitle)
                .foregroundStyle(Color.secondary)
                .font(.system(size: 15, weight: .regular))
                .frame(width: 300, alignment: .center)
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .padding(.bottom, 60)
            
            Image(data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .infinity, height: 210)
            
            Spacer()
            
        }
    }
    
    @ViewBuilder
    func buildPagerFrame() -> some View {
        HStack {
            ForEach(0..<viewModel.story.count, id:\.self) { index in
                ZStack(alignment: .leading) {
                    
                    RoundedRectangle(cornerRadius: 3)
                        .fill(Color(.systemGray6))
                    
                    RoundedRectangle(cornerRadius: 3)
                        .fill(viewModel.selection == index ? Color.black : Color(.systemGray6))
                        .frame(width: .infinity)
                    
                }
                .frame(width: .infinity, height: 6)
            }
        }
    }
    
}

#Preview {
    WelcomeAppStory()
}
