//
//  LinkListView.swift
//  linker
//
//  Created by Sanz Copacabana on 16/2/23.
//

import SwiftUI

struct LinkListView: View {
    
    var list = ["soy link","soy link","soy link"]

    @ObservedObject var state = LinkListState()
    
    var body: some View {
        List(state.linkList, id: \.self) { item in
            Text(item ?? "some error").onTapGesture {
                UIPasteboard.general.string = item
            }
        }
    }
}

struct LinkListView_Previews: PreviewProvider {
    static var previews: some View {
        LinkListView()
    }
}
