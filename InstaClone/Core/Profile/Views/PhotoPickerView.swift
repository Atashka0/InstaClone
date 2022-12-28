//
//  PhotoPickerView.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 28.12.2022.
//

import SwiftUI

struct PhotoPickerView: View {
    @State var showImagePicker: Bool = false
    @State var selectedImage: UIImage? = UIImage()
    var body: some View {
        Button {
            self.showImagePicker.toggle()
        } label: {
            Text("Upload a profile photo")
                .foregroundColor(.black)
                .font(.system(size: 25))
                .frame(width: 200, height: 200)
                .background(Color.white)
                .overlay(Circle().stroke(lineWidth: 5).foregroundColor(.black))
                .clipShape(Circle())
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $selectedImage)
        }
    }
}

struct PhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerView()
    }
}
