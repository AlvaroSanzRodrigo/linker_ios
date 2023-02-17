//
//  ContentView.swift
//  linker
//
//  Created by Sanz Copacabana on 16/2/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var state: LoginState
    
    var body: some View {
        VStack(alignment: .center) {
            switch (state.state) {
            case .signedIn:
                MainView()
            case .signedOut:
                LoginView().environmentObject(state)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LoginState())
    }
}
