//
//  AuthViewModel.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 28.12.2022.
//

import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
}
