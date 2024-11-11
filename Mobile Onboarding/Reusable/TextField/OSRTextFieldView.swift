//
//  OSRTextFieldView.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 11/11/24.
//


import SwiftUI

public struct TextFieldView: View {
    
    @Binding var text: String
    @State var placeholder: String
    
    public init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
    }
    
    public var body: some View {
        TextField("", text: $text,  prompt: createPlaceholder())
            .textFieldStyle(.outlined())
    }
    
    @ViewBuilder
    func createPlaceholder() -> Text {
        Text(placeholder)
            .font(.system(size: 16))
            .foregroundStyle(.gray)
            .fontWeight(.regular)
    }
}

#Preview {
    TextFieldView(text: .constant(""), placeholder: "e.g My home")
}
