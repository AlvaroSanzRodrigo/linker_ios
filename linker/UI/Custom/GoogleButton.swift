//
//  GoogleButton.swift
//  linker
//
//  Created by Sanz Copacabana on 16/2/23.
//

import SwiftUI
import GoogleSignIn

struct GoogleButton: UIViewRepresentable {
    @Environment(\.colorScheme) var colorScheme

    private var button = GIDSignInButton()

    func makeUIView(context: Context) -> GIDSignInButton {
    button.colorScheme = colorScheme == .dark ? .dark : .light
    return button
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    button.colorScheme = colorScheme == .dark ? .dark : .light
    }
}
