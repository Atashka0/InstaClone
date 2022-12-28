//
//  UserService.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 28.12.2022.
//

import Foundation
import FirebaseFirestore

struct UserService {
    static func fetchData(withUID uid: String, completion: @escaping (User) -> Void) {
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            guard let snapshot = snapshot, error == nil else {
                return
            }
            guard let user = try? snapshot.data(as: User.self) else {return}
            completion(user)
        }
        
        
    }
}
