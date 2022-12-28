//
//  MainTabView.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 28.12.2022.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .onTapGesture {
                    selectedTab = 0
                }
                .tabItem {
                    Image(systemName: "house.fill")
                }.tag(0)
            SearchView()
                .onTapGesture {
                    selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            ProfileView()
                .onTapGesture {
                    selectedTab = 2
                }
                .tabItem {
                    Image(systemName: "person")
                }.tag(2)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
