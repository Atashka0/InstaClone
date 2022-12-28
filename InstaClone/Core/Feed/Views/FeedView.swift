//
//  FeedView.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 26.12.2022.
//

import SwiftUI

struct FeedView: View {
    
    var body: some View {
        VStack {
            headerView
            
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
                    
                    LazyVStack {
                        ForEach(0 ... 20, id: \.self) { _ in
                            PostView()
                        }
                    }
                }
            }
    }
        //.edgesIgnoringSafeArea(.top)
}
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}

extension FeedView {
    var headerView: some View {
        ZStack {
            HStack(spacing: 15) {
                Text("Instagram")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .bold()
                Spacer()
                Image(systemName: "plus.app")
                    .resizable()
                    .frame(width: 25, height: 25)
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 25, height: 25)
                Image(systemName: "plus.message")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
            .padding(.horizontal)
        }
    }
}
