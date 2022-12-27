//
//  SearchView.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 27.12.2022.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    var body: some View {
        VStack {
            CustomInputView(placeholder: "Search", imageName: "magnifyingglass", text: $searchText)
                .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color(uiColor: .systemGray5)))
                .clipShape(RoundedRectangle(cornerRadius: 7))
                .padding(.horizontal)
            ScrollView {
                GridForPostsView()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
