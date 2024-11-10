//
//  ContentViewModel.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 10/11/24.
//

import SwiftUI

struct Page: Identifiable {
    var id = UUID()
    var title: String
    var page: any View
    var isPresent: Bool
    
    func presentView() -> some View {
        return AnyView(page)
    }
}

@Observable
class ContentViewModel {
    
    var welcomes: [Page] = [
        Page(title: "Welcome App", page: Welcome(), isPresent: false),
        Page(title: "Welcome App Feature Update", page: WelcomeApp(), isPresent: false),
        Page(title: "Welcome App Story",page: WelcomeAppStory(), isPresent: false)
    ]
    
}
