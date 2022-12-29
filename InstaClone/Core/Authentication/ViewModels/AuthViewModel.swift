//
//  AuthViewModel.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 28.12.2022.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore


class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        print("DEBUG: UserSession has new value")
        self.userSession = Auth.auth().currentUser
        
        fetchData()
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
    
    func uploadImage(image: UIImage) {
        guard let uid = self.userSession?.uid else {return}
        ImageUploader.uploadImage(image: image) { urlString in
            Firestore.firestore().collection("users")
                .document(uid).updateData(["profileImageUrl" : urlString])
        }
    }
    
    func fetchData() {
        guard let uid = self.userSession?.uid else {return}
        UserService.fetchData(withUID: uid) { user in
            self.currentUser = user
            print("DEBUG: Current user is \(user.username)")
        }
    }
    
    func uploadBio(withBio bio: String) {
        guard let uid = self.userSession?.uid else {return}
            Firestore.firestore().collection("users")
                .document(uid).updateData(["bio" : bio])
        self.fetchData()
    }
}
