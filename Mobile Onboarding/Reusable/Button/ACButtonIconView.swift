//
//  ACButtonIconView.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 10/11/24.
//

import SwiftUI

public struct ACButtonIconView: View {
    
    public var icon: String
    @Binding public var disabled: Bool
    public var action: () -> Void
    public var style: ButtonStyle = ButtonStyle.primary
    
    public enum ButtonStyle {
        case primary
        case secondary
    }
    
    public init(icon: String, style: ButtonStyle = .primary, disabled: Binding<Bool> = .constant(false), action: @escaping () -> Void) {
        self.icon = icon
        self.style = style
        self._disabled = disabled
        self.action = action
    }
    
    public var body: some View {
        switch style {
        case .primary:
            createPrimaryButton()
        case .secondary:
            createSecondaryButton()
        }
    }
    
    @ViewBuilder
    func createPrimaryButton() -> some View {
        HStack {
            Button(action: action) {
                Image(icon)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .buttonStyle(.primary(disabled: disabled))
            .disabled(disabled)
        }
        .frame(maxWidth:.infinity)
    }
    
    @ViewBuilder
    func createSecondaryButton() -> some View {
        HStack {
            Button(action: action) {
                Image(icon)
                    .frame(maxWidth: .infinity, minHeight: 48)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(15)
            }
//            .buttonStyle(.secondary(disabled: disabled))
            .disabled(disabled)
        }
        .frame(maxWidth:.infinity)
    }
}

#Preview {
    ACButtonIconView(icon: "googleIcon", style: .secondary) { }
}
