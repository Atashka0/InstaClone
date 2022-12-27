//
//  PostsFilterViewModel.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 27.12.2022.
//

import Foundation

enum PostsFilterViewModel: CaseIterable {
    case personal
    case tagged
    
    var imageTitle: String {
        switch self {
        case .personal:
            return "squareshape.split.3x3"
        case .tagged:
            return "person.crop.square"
        }
    }
}
