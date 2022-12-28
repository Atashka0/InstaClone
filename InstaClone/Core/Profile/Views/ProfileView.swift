//
//  ProfileView.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 27.12.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @State var selectedFilter: PostsFilterViewModel = .personal
    @State var presentSheet: Bool = false
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            ScrollView(.vertical) {
                profileFollowInfoView
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Art")
                        .font(.system(size: 14))
                    
                    Text("modeling:")
                        .font(.system(size: 14))
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                
                HStack {
                    Text("Edit Profile")
                        .frame(width: 350, height: 34)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.white))
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Image(systemName: "person.badge.plus")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .padding(4)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(0 ... 20, id: \.self) { _ in
                            StoryView()
                                .padding(.leading, 8)
                        }
                    }
                }
                .frame(height: 115)
                
                postsFilterView
                    .padding(.top)
                    .padding(.bottom, -8)
                
                GridForPostsView()
            }
        }
        //.edgesIgnoringSafeArea(.top)
    }
}



extension ProfileView {
    var headerView: some View  {
        ZStack {
            HStack(spacing: 20) {
                Text("ilyaskb")
                    .font(.system(size: 16))
                    .bold()
                Spacer()
                Image(systemName: "plus.app")
                    .resizable()
                    .frame(width: 20, height: 20)
                Button {
                    self.presentSheet = true
                } label: {
                    Image(systemName: "list.dash")
                        .resizable()
                        .frame(width: 20, height: 18)
                }
                .sheet(isPresented: $presentSheet) {
                    VStack(alignment: .leading) {
                        ForEach(ProfileSheetViewModel.allCases, id: \.self) { item in
                            HStack {
                                Image(item.imageName)
                                    .foregroundColor(.black)
                                Text(item.title)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                        }
                    }
                    
                }
                
            }
            .padding(.horizontal)
        }
    }
    
    var profileFollowInfoView: some View {
        HStack(spacing: 35) {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            Spacer()
            
            VStack {
                Text("0")
                    .bold()
                Text("Posts")
                    .minimumScaleFactor(0.7)
                    .lineLimit(1)
                    .font(.subheadline)
            }
            VStack {
                Text("0")
                    .bold()
                Text("Followers")
                    .minimumScaleFactor(0.7)
                    .lineLimit(1)
                    .font(.subheadline)
            }
            
            VStack {
                Text("0")
                    .bold()
                Text("Following")
                    .minimumScaleFactor(0.7)
                    .lineLimit(1)
                    .font(.subheadline)
                
            }
        }
    }
    
    var postsFilterView: some View {
        HStack {
            ForEach(PostsFilterViewModel.allCases, id: \.self) { item in
                VStack {
                    Image(systemName: item.imageTitle)
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(.black)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(.clear)
                            .frame(height:3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        selectedFilter = item
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
