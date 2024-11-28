//
//  ContentViewModel.swift
//  Mobile Onboarding
//
//  Created by Agus Cahyono on 10/11/24.
//

import SwiftUI

@Observable
class ContentViewModel {
    
    var sections: [Sections] = [
        Sections(title: "Welcome Onboarding", pages: [
            Page(title: "Welcome App", page: Welcome()),
            Page(title: "Welcome App Feature Update", page: WelcomeApp()),
            Page(title: "Welcome App Story",page: WelcomeAppStory())
        ]),
        Sections(title: "Login Register Onboarding", pages: [
            Page(title: "Login / Register Using BottomSheet", page: LoginOrRegisterBottomSheetView()),
            Page(title: "Login / Register using Social", page: SocialLoginRegisterView()),
            Page(title: "Login Form", page: LoginFormView()),
        ]),
        Sections(title: "Email Onboarding", pages: [
            Page(title: "Email Subscription", page: EmailSubscriptionView(), type: .page),
            Page(title: "Input Email", page: InputEmailView(), type: .page),
        ]),
        Sections(title: "Email Confirmation Onboarding", pages: [
            Page(title: "Email Confirmation View", page: InputConfirmEmailView(), type: .page),
            Page(title: "Email Confirmation Link", page: ConfirmEmailWithLinkView(), type: .page),
        ]),
    ]
    
    func onTapButtonNavigation(index: Int, indexPage: Int) {
        if sections[index].pages[indexPage].type == .modal {
            sections[index].pages[indexPage].isPresent.toggle()
        } else {
            sections[index].pages[indexPage].isPush.toggle()
        }
    }
    
}
