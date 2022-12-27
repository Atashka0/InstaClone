//
//  GridForPostsView.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 27.12.2022.
//

import SwiftUI

struct GridForPostsView: View {
    var columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(0 ..< 21, id: \.self) { index in
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 130)
                    .border(.white)
                    .padding(.trailing, -8)
            }
        }
    }
}

struct GridForPostsView_Previews: PreviewProvider {
    static var previews: some View {
        GridForPostsView()
    }
}
