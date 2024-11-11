//
//  FillButton.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 11/11/24.
//

import SwiftUI

struct ButtonView: View{
    
    public var title: String?
    public var icon: String?
    public var style: Style = .primary
    public var action: () -> Void
    
    enum Style {
        case primary
        case secondary
        case tertiary
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
                            .foregroundColor(foregroundColor)
                            .font(.system(size: 16, weight: .semibold))
                    }
                }
                else if let title {
                    Text(title)
                        .foregroundColor(foregroundColor)
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
                    .stroke(style == .primary || style == .tertiary ? .clear : Color.gray.opacity(0.4))
            }
        }
    }
    
    var foregroundColor: Color {
        switch style {
        case .primary:
               return .white
        case .secondary:
            return .black
        case .tertiary:
            return .blue
        }
    }
}

#Preview {
    ButtonView(title: "Get Started", style: .tertiary) { }
}
