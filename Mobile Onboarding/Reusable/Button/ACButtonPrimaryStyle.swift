//
//  ACButtonPrimaryStyle.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 08/11/24.
//


import SwiftUI

struct ACButtonPrimaryStyle: ButtonStyle {
    
    private let backgroundColor: Color = .blue
    private let foregroundColor: Color = .white
    let isDisabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.3) : foregroundColor
        return configuration.label
            .padding()
            .foregroundColor(isDisabled ? currentForegroundColor.opacity(0.5) : currentForegroundColor)
            .background(makeBackground(isPressed: configuration.isPressed))
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(.clear, lineWidth: 0)
        )
            .font(Font.system(size: 16, weight: .semibold))
    }
    
    private func makeBackground(isPressed: Bool) -> Color {
        if isDisabled {
            return backgroundColor.opacity(0.5)
        } else if isPressed {
            return backgroundColor.opacity(0.9)
        } else {
            return backgroundColor
        }
    }
} 

extension ButtonStyle where Self == ACButtonPrimaryStyle {
    static func primary(disabled: Bool) -> Self { Self(isDisabled: disabled) }
}
