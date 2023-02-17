//
//  LinkListState.swift
//  linker
//
//  Created by Sanz Copacabana on 16/2/23.
//

import Foundation

import Firebase
import GoogleSignIn

class LinkListState: ObservableObject {
    
    @Published var linkList: [String?] = []
    
    init() {
        getLinks()
    }
    private func getLinks() {
        guard let userId = GIDSignIn.sharedInstance.currentUser?.userID else { return }
    
        let ref = Database.database().reference()
        let arrayRef = ref.child("users").child(userId)

        arrayRef.observe(.value) { (snapshot) in
            print(type(of: snapshot))
            if let array = snapshot.value as? [String] {
                // Handle the array data here
                self.linkList = array
            }
        }
    }
}
