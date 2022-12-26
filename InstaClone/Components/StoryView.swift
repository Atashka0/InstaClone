//
//  StoryView.swift
//  InstaClone
//
//  Created by Ilyas Kudaibergenov on 26.12.2022.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        VStack {
            Circle()
                .frame(width: 80, height: 80)
                .foregroundColor(Color(.systemBlue))
            Text("sheryl_srystal")
                .font(.system(size: 13))
                .foregroundColor(.gray)
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
