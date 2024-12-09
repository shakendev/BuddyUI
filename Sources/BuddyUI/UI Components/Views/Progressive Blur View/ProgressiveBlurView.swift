//
//  ProgressiveBlurView.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - ProgressiveBlurView

///
///
///
@available(iOS 18.0, *)
public struct ProgressiveBlurView: UIViewRepresentable {

    // MARK: - Private properties
    
    private let radius: CGFloat
    private let direction: Direction



    // MARK: - Init

    ///
    ///
    ///
    public init(
        radius: CGFloat = 10,
        from direction: Direction = .bottom
    ) {
        self.radius = radius
        self.direction = direction
    }



    // MARK: - Public methods

    ///
    ///
    ///
    public func makeUIView(context: Context) -> UIVisualEffectView {
        VariableBlurView(radius: radius, direction: direction)
    }

    ///
    ///
    ///
    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) { }
}



// MARK: - Live Preview

#Preview {
    ScrollView(.vertical) {
        LazyVStack {
            ForEach(.zero ..< 20, id: \.self) { _ in
                HStack {
                    ForEach(.zero ..< 2, id: \.self) { _ in
                        Rectangle()
                            .foregroundStyle([Color.red, .green, .blue].randomElement()!)
                            .frame(height: 100)
                    }
                }
            }
        }
    }
    .padding(.horizontal)
    .overlay(alignment: .top) {
        VStack {
            ProgressiveBlurView(radius: 5, from: .top)
                .frame(height: 150)
                .border(.black, width: 1)

            ProgressiveBlurView(radius: 5, from: .leading)
                .frame(height: 150)
                .border(.black, width: 1)

            ProgressiveBlurView(radius: 5, from: .trailing)
                .frame(height: 150)
                .border(.black, width: 1)

            ProgressiveBlurView(radius: 5, from: .bottom)
                .frame(height: 150)
                .border(.black, width: 1)
        }
    }
}
