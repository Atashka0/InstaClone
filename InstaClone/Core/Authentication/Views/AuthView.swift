//
//  AuthView.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 27.12.2022.
//

import SwiftUI

struct AuthView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            Spacer()
            Text("Instagram")
                .font(.system(size: 45, weight: .bold, design: .rounded))
                .bold()
            TextField("Username",text: $username)
                .padding()
                .frame(height: 45)
                .background(Color(.systemGray5))
                .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color(uiColor: .systemGray5)))
                .clipShape(RoundedRectangle(cornerRadius: 7))
            TextField("Password",text: $password)
                .padding()
                .frame(height: 45)
                .background(Color(.systemGray5))
                .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color(uiColor: .systemGray5)))
                .clipShape(RoundedRectangle(cornerRadius: 7))
            
            HStack {
                Spacer()
                NavigationLink {
                    Text("LOL")
                } label: {
                    Text("Forgotten password?")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }

            }
            Button {
                
            } label: {
                Text("Log in")
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 45)
            .foregroundColor(.white)
            .background(.blue)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(uiColor: .systemGray5)))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.top, 10)
            Spacer()
            Spacer()
            
            HStack {
                Text("Don' have an account?")
                    .foregroundColor(.gray)
                
                NavigationLink {
                    
                } label: {
                    Text("Sign Up")
                        .foregroundColor(.blue)
                }

            }

        }
        .padding(.horizontal)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
