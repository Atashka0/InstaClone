//
//  FeedView.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 26.12.2022.
//

import SwiftUI

struct FeedView: View {
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(0 ... 20, id: \.self) { _ in
                            StoryView()
                                .padding(.leading, 8)
                        }
                    }
                }
                .frame(height: 115)
                
                ScrollView(.vertical) {
                    LazyVStack {
                        ForEach(0 ... 20, id: \.self) { _ in
                            PostView()
                        }
                    }
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
