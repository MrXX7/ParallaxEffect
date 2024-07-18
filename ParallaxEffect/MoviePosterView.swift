//
//  MoviePosterView.swift
//  ParallaxEffect
//
//  Created by Oncu Can on 18.07.2024.
//

import SwiftUI

struct MoviePosterView: View {
    let imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(RoundedRectangle(cornerRadius: 32))
    }
}

#Preview {
    MoviePosterView(imageName: "1")
}
