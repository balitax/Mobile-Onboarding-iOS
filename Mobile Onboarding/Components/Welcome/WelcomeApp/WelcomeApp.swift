//
//  WelcomeApp.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 08/11/24.
//

import SwiftUI

struct WelcomeApp: View {
    
    @State var viewModel = WelcomeAppViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            Text("Welcome to App")
                .font(.system(size: 24, weight: .bold))
                .padding(.top, 80)
            
            VStack {
                
                VStack(alignment: .leading) {
                    ForEach(viewModel.data) { data in
                        HStack(alignment: .top, spacing: 16) {
                            Image(systemName: data.icon)
                                .font(.system(size: 40))
                                .foregroundStyle(.blue)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(data.title)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundStyle(.primary)
                                
                                Text(data.subTitle)
                                    .font(.system(size: 15, weight: .regular))
                                    .foregroundStyle(.secondary)
                                
                            }
                        }
                        .padding(.all, 8)
                    }
                }
                .padding(.top, 24)
                
                Spacer()
                
                ACButtonView(title: "Get started", action: {
                    dismiss()
                })
            }
            .padding()
        }
    }
}

#Preview {
    WelcomeApp()
}
