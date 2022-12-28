//
//  AuthViewModel.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 28.12.2022.
//

import SwiftUI
import FirebaseAuth
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func register(withEmail mail: String, withUsername nick: String, withPassword password: String, withConfirmedPassword passwordConfirmed: String) {
        guard password == passwordConfirmed else {
            print("u dumb")
            return
            
        }
        Auth.auth().createUser(withEmail: mail, password: password) { result, error in
            guard error == nil else {return}
            guard let user = result?.user else {return}
            self.userSession = user
            
            let data = ["username" : nick,
                        "password" : password,
                        "mail" : mail]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    
                    
                }
        }
    }
    
    func login(mail: String, password: String) {
        Auth.auth().signIn(withEmail: mail, password: password) { result, error in
            guard error == nil else {return}
            self.userSession = result?.user
        }
    }
    
    func logOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
}
