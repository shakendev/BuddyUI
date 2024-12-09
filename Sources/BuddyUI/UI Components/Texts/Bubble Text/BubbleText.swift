//
//  BubbleText.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - BubbleText

///
///
///
@available(iOS 18.0, *)
public struct BubbleText: View {

    // MARK: - Private properties

    private let text: String

    @Environment(\.bubbleTextStyle) private var bubbleTextStyle



    // MARK: - Body

    public var body: some View {
        textView
            .foregroundStyle(bubbleTextStyle.color)
            .overlay {
                ZStack {
                    strokedTextView(with: bubbleTextStyle.shadow0)

                    strokedTextView(with: bubbleTextStyle.shadow1)
                }
            }
            .background {
                BlurView(radius: bubbleTextStyle.radius)
            }
            .mask { textView }
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(_ text: String) {
        self.text = text
    }
}



// MARK: - UI

private extension BubbleText {
    @ViewBuilder var textView: some View {
        Text(text)
            .font(.init(bubbleTextStyle.font))
    }

    @ViewBuilder
    private func strokedTextView(with shadow: BubbleText.Style.Shadow) -> some View {
        StrokedText(
            text,
            color: shadow.color,
            font: bubbleTextStyle.font,
            width: shadow.width
        )
        .offset(x: shadow.offset.x, y: shadow.offset.y)
        .blur(radius: shadow.radius)
    }
}



// MARK: - Live Preview

#Preview {
    BubbleText("Swift Journey")
        .bubbleTextStyle(
            .init(
                color: .black.opacity(0.5),
                font: .init(name: "Arial Rounded MT Bold", size: 60)!,
                shadow0: .init(color: .white, width: 5, radius: 2, offset: .init(x: 0.5, y: 0.5)),
                shadow1: .init(color: .black, width: 2, radius: 1, offset: .init(x: -1, y: -1))
            )
        )
}
