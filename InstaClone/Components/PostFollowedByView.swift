//
//  PostFollowedByView.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 27.12.2022.
//

import SwiftUI

struct PostFollowedByView: View {
    var body: some View {
        HStack(spacing: -5) {
            Circle()
                .frame(width: 20, height: 20)
                .overlay(Circle()
                    .stroke(.white))
            Circle()
                .frame(width: 20, height: 20)
                .overlay(Circle()
                    .stroke(.white, lineWidth: 2))
            Circle()
                .frame(width: 20, height: 20)
                .overlay(Circle()
                    .stroke(.white, lineWidth: 2))
            
            HStack(spacing: 2) {
                Text("Followed by")
                Text("thisisaikerim")
                    .bold()
                Text("and")
                Text("386 545 others")
                    .bold()
            }
            .padding(.leading)
            .font(.system(size: 15))
        }
    }
}

struct PostFollowedByView_Previews: PreviewProvider {
    static var previews: some View {
        PostFollowedByView()
    }
}
