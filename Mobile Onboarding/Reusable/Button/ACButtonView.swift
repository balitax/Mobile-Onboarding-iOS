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
    
    public init(title: String, disabled: Binding<Bool> = .constant(false), action: @escaping () -> Void) {
        self.title = title
        self._disabled = disabled
        self.action = action
    }
    
    public var body: some View {
        createPrimaryButton()
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
}

#Preview {
    ACButtonView(title: "Get Started") { }
}
