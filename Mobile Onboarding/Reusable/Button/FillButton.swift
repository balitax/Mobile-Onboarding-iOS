//
//  FillButton.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 11/11/24.
//

import SwiftUI

struct FillButton: View{
    
    public var title: String?
    public var icon: String?
    public var style: Style = .primary
    public var action: () -> Void
    
    enum Style {
        case primary
        case secondary
    }
    
    var body: some View {
        Button{
            action()
        } label: {
            VStack {
                if let title, let icon {
                    HStack {
                        Image(icon)
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        Text(title)
                            .foregroundColor(style == .primary ? .white : .black)
                            .font(.system(size: 16, weight: .semibold))
                    }
                }
                else if let title {
                    Text(title)
                        .foregroundColor(style == .primary ? .white : .black)
                        .font(.system(size: 16, weight: .semibold))
                } else if let icon {
                    Image(icon)
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 54)
            .background(style == .primary ? .blue : .white)
            .cornerRadius(14)
            .overlay {
                RoundedRectangle(cornerRadius: 14)
                    .stroke(style == .primary ? .clear : Color.gray.opacity(0.4))
            }
        }
    }
}

#Preview {
    FillButton(title: "Get Started", style: .secondary) { }
}
