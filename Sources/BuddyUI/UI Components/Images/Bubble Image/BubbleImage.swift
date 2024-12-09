//
//  BubbleImage.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - BubbleImage

///
///
///
@available(iOS 18.0, *)
public struct BubbleImage: View {

    // MARK: - Private properties

    private let name: String

    @Environment(\.bubbleImageStyle) private var bubbleImageStyle



    // MARK: - Body

    public var body: some View {
        Image(systemName: name)
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(
                bubbleImageStyle.color
                    .shadow(
                        .inner(
                            color: bubbleImageStyle.shadow0.color,
                            radius: bubbleImageStyle.shadow0.radius,
                            x: bubbleImageStyle.shadow0.offset.x,
                            y: bubbleImageStyle.shadow0.offset.y
                        )
                    )
                    .shadow(
                        .inner(
                            color: bubbleImageStyle.shadow1.color,
                            radius: bubbleImageStyle.shadow1.radius,
                            x: bubbleImageStyle.shadow1.offset.x,
                            y: bubbleImageStyle.shadow1.offset.y
                        )
                    )
            )
            .background {
                BlurView(radius: bubbleImageStyle.radius)
            }
            .mask {
                Image(systemName: name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(systemName name: String) {
        self.name = name
    }
}



// MARK: - Live Preview

#Preview {
    HStack(spacing: 20) {
        BubbleImage(systemName: "swift")
            .bubbleImageStyle(
                .init(
                    color: .yellow.opacity(0.5),
                    blur: 10,
                    shadow0: .init(color: .white.opacity(0.8), radius: 2, offset: .init(x: 5, y: 5)),
                    shadow1: .init(color: .orange.opacity(0.7), radius: 2, offset: .init(x: -5, y: -5))
                )
            )
            .frame(height: 70)

        BubbleText("Journey")
            .bubbleTextStyle(
                .init(
                    color: .yellow.opacity(0.5),
                    font: .init(name: "Arial Rounded MT Bold", size: 70)!,
                    shadow0: .init(color: .white, width: 5, radius: 2, offset: .init(x: 1, y: 1)),
                    shadow1: .init(color: .orange, width: 2, radius: 2, offset: .init(x: -1, y: -1))
                )
            )
    }
    .shadow(color: .black.opacity(0.2), radius: 5, y: 5)
}
