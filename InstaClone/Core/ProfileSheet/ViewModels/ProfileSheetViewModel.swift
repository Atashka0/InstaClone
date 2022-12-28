//
//  ProfileSheetViewModel.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 28.12.2022.
//

import Foundation

enum ProfileSheetViewModel: CaseIterable {
    case saved
    case closeFriends
    case logout
    var title: String {
        switch self {
        case .closeFriends:
            return "Close Friends"
        case .logout:
            return "Log out"
        case .saved:
            return "Saved"
        }
    }
    var imageName: String {
        switch self {
        case .closeFriends:
            return "list.star"
        case .logout:
            return "person.fill.xmark"
        case .saved:
            return "bookmark"
        }
    }
}
