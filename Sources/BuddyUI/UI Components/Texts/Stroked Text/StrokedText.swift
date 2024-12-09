//
//  StrokedText.swift
//  Swift Buddy
//
//  Created by Dimka Novikov on 30.11.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - StrokedText

///
///
///
@available(iOS 18.0, *)
public struct StrokedText: UIViewRepresentable {

    // MARK: - Private properties

    private let text: String

    private let color: Color

    private let font: UIFont

    private let width: CGFloat



    // MARK: - Init

    ///
    ///
    ///
    public init(
        _ text: String,
        color: Color = .primary,
        font: UIFont = .systemFont(ofSize: 20),
        width: CGFloat = 2
    ) {
        self.text = text
        self.color = color
        self.font = font
        self.width = width
    }



    // MARK: - Public methods

    ///
    ///
    ///
    public func makeUIView(context: Context) -> UIView {
        StrokedLabelView(
            text: text,
            color: .init(color),
            font: font,
            width: width
        )
    }

    ///
    ///
    ///
    public func updateUIView(_ uiView: UIView, context: Context) { }
}



// MARK: - Live Preview

#Preview {
    @Previewable @State var isScaled = false

    VStack {
        ForEach(.zero ..< 3, id: \.self) { _ in
            Text("Bubble Text")
                .foregroundStyle(.black.opacity(0.5))
                .font(.custom("Arial Rounded MT Bold", size: 30))
                .overlay {
                    ZStack {
                        StrokedText(
                            "Bubble Text",
                            color: .white,
                            font: .init(name: "Arial Rounded MT Bold", size: 30)!,
                            width: 5
                        )
                        .offset(x: 0.5, y: 0.5)
                        .blur(radius: 1)

                        StrokedText(
                            "Bubble Text",
                            color: .black,
                            font: .init(name: "Arial Rounded MT Bold", size: 30)!,
                            width: 2
                        )
                        .offset(x: -0.5, y: -0.5)
                        .blur(radius: 1)
                    }
                }
                .mask {
                    Text("Bubble Text")
                        .font(.custom("Arial Rounded MT Bold", size: 30))
                }
                .onTapGesture {
                    isScaled.toggle()
                }
                .scaleEffect(isScaled ? .init(width: 0.9, height: 0.9) : .identity)
                .animation(.smooth, value: isScaled)
        }
    }
}

