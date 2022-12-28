//
//  InstaCloneApp.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 26.12.2022.
//

import SwiftUI
import Firebase

@main
struct InstaCloneApp: App {

    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
