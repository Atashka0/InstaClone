//
//  CustomInputView.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 27.12.2022.
//

import SwiftUI

struct CustomInputView: View {
    var placeholder: String
    var imageName: String?
    var isSecuredField: Bool = false
    @Binding var text: String
    var body: some View {
        HStack {
            if let imageName = imageName {
                Image(systemName: imageName)
                    .foregroundColor(.gray)
                    .padding(.leading)
            }
            if self.isSecuredField {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder,text: $text)
            }
            
        }
        .frame(height: 40)
        .background(Color(.systemGray5))
    }
}

struct CustomInputView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputView(placeholder: "Search", imageName: "magnifyingglass", text: .constant(""))
    }
}
