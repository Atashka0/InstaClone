//
//  ProfileView.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 27.12.2022.
//

import SwiftUI
import Kingfisher
struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedFilter: PostsFilterViewModel = .personal
    @State var presentSheet: Bool = false
    @State var showImagePicker: Bool = false
    @State var selectedImage: UIImage?
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
                
                
                profileButtonsView
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
    }
}



extension ProfileView {
    var headerView: some View  {
        ZStack {
            HStack(spacing: 20) {
                if let user = viewModel.currentUser {
                    Text("\(user.username)")
                    .font(.system(size: 16))
                    .bold()
                    .onReceive(viewModel.$userSession) { _ in
                        self.viewModel.fetchData()
                    }
                }
                Spacer()
                Image(systemName: "plus.app")
                    .resizable()
                    .frame(width: 20, height: 20)
                Button {
                    self.presentSheet = true
                } label: {
                    Image(systemName: "list.dash")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 20, height: 18)
                }
                .sheet(isPresented: $presentSheet) {
                    sideMenuSheet
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
            }
            .padding(.horizontal)
        }
    }
    
    var profileFollowInfoView: some View {
        HStack(spacing: 35) {
            Button {
                self.showImagePicker.toggle()
                guard let selectedImage = self.selectedImage else {return}
                self.viewModel.uploadImage(image: selectedImage)
                
            } label: {
                if let profileImageUrl = self.viewModel.currentUser?.profileImageUrl {
                    KFImage(URL(string: profileImageUrl))
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay {
                            Image(systemName: "plus")
                                .frame(width: 5, height: 5)
                                .padding(10)
                                .background(.blue)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .offset(x:35, y: 35)
                        }
                } else {
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 30, height: 25)
                        .padding(.horizontal, 35)
                        .padding(.vertical, 37.5)
                        .foregroundColor(.white)
                        .background(.gray)
                        .clipShape(Circle())
                        .overlay {
                            Image(systemName: "plus")
                                .frame(width: 5, height: 5)
                                .padding(10)
                                .background(.blue)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .offset(x:35, y: 35)
                        }
                    
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            Spacer()
            
            VStack {
                Text("0")
                    .bold()
                Text("Posts")
                    .lineLimit(1)
                    .font(.caption)
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
    
    var sideMenuSheet: some View {
        VStack(alignment: .leading) {
            ForEach(ProfileSheetViewModel.allCases, id: \.self) { item in
                HStack {
                    Button {
                        viewModel.logOut()
                    } label: {
                        Image(systemName: item.imageName)
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                        Text(item.title)
                            .foregroundColor(.black)
                    }
                }
                
            }
        }
    }
    var profileButtonsView: some View {
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
