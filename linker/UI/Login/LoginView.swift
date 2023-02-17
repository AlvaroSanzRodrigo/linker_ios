//
//  LoginView.swift
//  linker
//
//  Created by Sanz Copacabana on 16/2/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var state: LoginState
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Linker")
            Spacer()
            GoogleButton().frame(height: 50)
                .onTapGesture {
                    state.signIn()
                }
        }.padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
