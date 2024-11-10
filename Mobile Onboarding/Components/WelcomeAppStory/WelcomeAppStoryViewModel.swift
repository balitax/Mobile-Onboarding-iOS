//
//  WelcomeAppStoryViewModel.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 08/11/24.
//

import SwiftUI

@Observable
class WelcomeAppStoryViewModel {
    
    var selection = 0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    struct WelcomeModel: Hashable, Identifiable {
        var id = UUID()
        let image: String
        let title: String
        let subTitle: String
    }
    
    var story: [WelcomeModel] = [
        WelcomeModel(image: "onboard1", title: "Halo, Perkenalkan Skuy!", subTitle: "Anda dapat membeli dan menjual internet Anda untuk terhubung dengan mudah dan aman."),
        WelcomeModel(image: "onboard2", title: "Butuhkan Internet?", subTitle: "Gunakan poin Skuy untuk menjelajahi internet."),
        WelcomeModel(image: "onboard3", title: "Mau Jual Internet?", subTitle: "Setiap penjualan, Anda akan mendapatkan poin, yang dapat ditukarkan dengan lebih banyak internet."),
        WelcomeModel(image: "onboard4", title: "Bagaimana?", subTitle: "Skuy menemukan pembeli dan penjual di dekat Anda dan mengirimkan notifikasi kepada Anda.")
    ]
}
