//
//  WelcomeViewModel.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 08/11/24.
//

import SwiftUI

@Observable
final class WelcomeViewModel {
    
    var currentStep = 0
    
    struct WelcomeModel: Hashable {
        let title: String
        let subTitle: String
    }
    
    let data: [WelcomeModel] = [
        WelcomeModel(title: "Welcome to App", subTitle: "Here’s a good place for a brief overview of the app or it’s key features."),
        WelcomeModel(title: "Welcome to App 2", subTitle: "Here’s a good place for a brief overview of the app or it’s key features."),
        WelcomeModel(title: "Welcome to App 3", subTitle: "Here’s a good place for a brief overview of the app or it’s key features.")
    ]

}
