//
//  PostView.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 27.12.2022.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                Circle()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.blue)
                
                Text("aespa_official")
                    .font(.footnote)
                    .bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.blue)
                Spacer()
                
                Image(systemName: "ellipsis")
                    .resizable()
                    .frame(width: 20, height: 5)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            Rectangle()
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 400)
                .foregroundColor(.blue)
            
            HStack(spacing: 14) {
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 20, height: 20)
                Image(systemName: "message")
                    .resizable()
                    .frame(width: 20, height: 20)
                Image(systemName: "paperplane")
                    .resizable()
                    .frame(width: 20, height: 20)
                Spacer()
                Image(systemName: "bookmark")
                    .resizable()
                    .frame(width: 18, height: 20)
            }
            .padding(.horizontal)
            
            PostFollowedByView()
                .padding(.leading)
            
            HStack(alignment: .center) {
                Text("behaviorhack")
                    .bold()
                Text("Start before you're ready.")
                    .font(.system(size: 15))
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, -5)
            
            Text("View all 727 comments")
                .padding(.horizontal)
                .foregroundColor(.gray)
            
            HStack {
                Text("8 October")
                Circle()
                    .frame(width: 3, height: 3)
                    .foregroundColor(.gray)
                Text("Suggested post")
            }
            .font(.system(size: 13))
            .foregroundColor(.gray)
            .padding(.horizontal)
            .padding(.top, -5)
                
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
