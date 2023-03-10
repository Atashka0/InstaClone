//
//  RegView.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 27.12.2022.
//

import SwiftUI

struct RegView: View {
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var passwordVerification: String = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Spacer()
            Text("Instagram")
                .font(.system(size: 45, weight: .bold, design: .rounded))
                .bold()
            TextField("Email",text: $email)
                .padding()
                .frame(height: 45)
                .background(Color(.systemGray5))
                .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color(uiColor: .systemGray5)))
                .clipShape(RoundedRectangle(cornerRadius: 7))
            TextField("Username",text: $username)
                .padding()
                .frame(height: 45)
                .background(Color(.systemGray5))
                .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color(uiColor: .systemGray5)))
                .clipShape(RoundedRectangle(cornerRadius: 7))
            CustomInputView(placeholder: "Password", isSecuredField: true, text: $password)
                .padding()
                .frame(height: 45)
                .background(Color(.systemGray5))
                .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color(uiColor: .systemGray5)))
                .clipShape(RoundedRectangle(cornerRadius: 7))
            CustomInputView(placeholder: "Confirm Password", isSecuredField: true, text: $passwordVerification)
                .padding()
                .frame(height: 45)
                .background(Color(.systemGray5))
                .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color(uiColor: .systemGray5)))
                .clipShape(RoundedRectangle(cornerRadius: 7))
            //refactor this
            Button {
                viewModel.register(withEmail: email, withUsername: username, withPassword: password, withConfirmedPassword: passwordVerification)
            } label: {
                Text("Sign up")
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 45)
            .foregroundColor(.white)
            .background(.blue)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(uiColor: .systemGray5)))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.top, 10)
            Spacer()
            
            HStack {
                Text("Already have an account?")
                    .foregroundColor(.gray)
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Log in")
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(.horizontal)
        
    }
}

struct RegView_Previews: PreviewProvider {
    static var previews: some View {
        RegView()
    }
}
