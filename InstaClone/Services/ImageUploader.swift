//
//  ImageUploader.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 28.12.2022.
//

import FirebaseStorage
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping (String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "profile_image/" + fileName)
        
        ref.putData(imageData, metadata: nil) { _, error in
            ref.downloadURL { url, error in
                guard let urlString = url?.absoluteString else {return}
                completion(urlString)
            }
        }
        
        
    }
}
