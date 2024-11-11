//
//  OutlinedTextFieldStyle.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 11/11/24.
//


import SwiftUI

public struct OutlinedTextFieldStyle: TextFieldStyle {
    
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(16)
        .font(.system(size: 16))
        .fontWeight(.semibold)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(14)
        .overlay {
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(Color.gray.opacity(0.1), lineWidth: 1)
        }
    }
}

extension TextFieldStyle where Self == OutlinedTextFieldStyle {
    static func outlined() -> Self { Self() }
}
