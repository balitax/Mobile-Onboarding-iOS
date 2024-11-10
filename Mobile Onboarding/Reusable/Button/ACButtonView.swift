//
//  ACButtonView.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 08/11/24.
//

import SwiftUI

public struct ACButtonView: View {
    
    public var title: String
    @Binding public var disabled: Bool
    public var action: () -> Void
    public var style: ButtonStyle = ButtonStyle.primary
    
    public enum ButtonStyle {
        case primary
        case secondary
    }
    
    public init(title: String, style: ButtonStyle = .primary, disabled: Binding<Bool> = .constant(false), action: @escaping () -> Void) {
        self.title = title
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
                Text(title)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
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
                Text(title)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.secondary(disabled: disabled))
            .disabled(disabled)
        }
        .frame(maxWidth:.infinity)
    }
}

#Preview {
    ACButtonView(title: "Get Started", style: .secondary) { }
}
