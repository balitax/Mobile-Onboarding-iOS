//
//  WelcomeAppViewModel.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 08/11/24.
//

import SwiftUI

@Observable
final class WelcomeAppViewModel {
    
    struct WelcomeAppModel: Hashable, Identifiable {
        var id = UUID()
        let icon: String
        let title: String
        let subTitle: String
    }
    
    let data: [WelcomeAppModel] = [
        WelcomeAppModel(icon: "ellipsis.bubble.fill", title: "In-app messaging", subTitle: "Send real-time update to keep your audience engaged and informed."),
        WelcomeAppModel(icon: "apps.ipad", title: "Personalization", subTitle: "User interface that adapts to their spesific needs and interest"),
        WelcomeAppModel(icon: "chart.bar.yaxis", title: "Analytics and reporting", subTitle: "Collect and analyze user behavior to improve your app")
    ]

}
