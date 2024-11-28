//
//  Section.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 28/11/24.
//

import SwiftUI

struct Sections: Identifiable {
    var id = UUID()
    var title: String
    var pages: [Page]
}
