//
//  LinkUploadState.swift
//  linker
//
//  Created by Sanz Copacabana on 16/2/23.
//

import Foundation
import Firebase
import GoogleSignIn

class LinkUploadState: ObservableObject {
    
    func uploadLink(link: String) {
        guard let userId = GIDSignIn.sharedInstance.currentUser?.userID else { return }
        
        
        let ref = Database.database().reference()
        let arrayRef = ref.child("users").child(userId)

        arrayRef.runTransactionBlock({ (currentData: MutableData) -> TransactionResult in
            if var currentArray = currentData.value as? [String] {
                // The array already exists, so update it
                currentArray.append(link)
                
                currentData.value = currentArray
                return TransactionResult.success(withValue: currentData)
            } else {
                // The array doesn't exist, so create it
                currentData.value = [link]
                return TransactionResult.success(withValue: currentData)
            }
        }) { (error, completed, snapshot) in
            if error != nil {
                print("Transaction failed with error: \(error!.localizedDescription)")
            } else {
                print("Transaction completed: \(completed)")
            }
        }
    }
}
