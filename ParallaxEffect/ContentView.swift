//
//  ContentView.swift
//  ParallaxEffect
//
//  Created by Oncu Can on 18.07.2024.
//

import SwiftUI

struct ContentView: View {
    private let images = (1...7).map {"\($0)"}
    private let titles = [
    "Oppenheimer",
    "Saw X",
    "Poor Things",
    "The Zone of Interest",
    "Indiana Jones",
    "Spider Man",
    "The Creator"
    ]
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        GeometryReader(content: { geometry in
            let width = geometry.size.width
            let height = 1.25 * width
            let offset = -width/2
            
            VStack(spacing: 20) {
                Text("Movie Universe")
                    .font(.title)
                    .bold()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 22, content: {
                        ForEach(images.indices, id: \.self) { index in
                            ZStack {
                                MoviePosterView(imageName: images[index])
                                    .frame(width: width, height: height)
                                    .scrollTransition(.interactive, axis: .horizontal) { content, phase in
                                        content.offset(x: phase.value * offset)
                                    }
                                    .overlay {
                                        LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                                    }
                                    .overlay(alignment: .bottom) {
                                        Text(titles[index])
                                            .font(.title)
                                            .bold()
                                            .foregroundStyle(.white)
                                            .padding(.bottom, 44)
                                    }
                            }
                            .containerRelativeFrame(.horizontal)
                            .clipShape(RoundedRectangle(cornerRadius: 32))
                            .shadow(color: colorScheme == .dark ? .white.opacity(0.5) : .black.opacity(0.5), radius: 5, x: 0, y: 2)
                        }
                    })
                    .scrollTargetLayout()
                    .padding([.top, .bottom], 20)
                }
                .frame(height: height)
                .contentMargins(.horizontal, 44)
                .scrollTargetBehavior(.paging)
            }
        })
    }
}

#Preview {
    ContentView()
}
