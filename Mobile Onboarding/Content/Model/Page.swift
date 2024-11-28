//
//  Page.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 28/11/24.
//

import SwiftUI

enum PageType {
    case modal
    case page
}

struct Page: Identifiable {
    var id = UUID()
    var title: String
    var page: any View
    var isPresent: Bool = false
    var isPush: Bool = false
    var type: PageType = .modal
    
    func presentView() -> some View {
        return AnyView(page)
    }
}
