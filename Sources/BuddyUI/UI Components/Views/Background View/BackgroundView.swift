//
//  BackgroundView.swift
//  Swift Buddy
//
//  Created by Dimka Novikov on 29.11.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - BackgroundView

///
///
///
@available(iOS 18.0, *)
public struct BackgroundView<Content: View>: View {

    // MARK: - Private properties

    private let backgroundColor: Color
    private let alignment: Alignment

    private let content: Content



    // MARK: - Body

    public var body: some View {
        backgroundColor
            .ignoresSafeArea()
            .overlay(alignment: alignment) {
                content
            }
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        color backgroundColor: Color = .primary,
        alignment: Alignment = .center,
        @ViewBuilder content: () -> Content
    ) {
        self.backgroundColor = backgroundColor
        self.alignment = alignment
        self.content = content()
    }
}



// MARK: - Live Preview

#Preview {
    BackgroundView(
        color: .init(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)),
        alignment: .top
    ) {
        Text("BackgroundView")
            .foregroundStyle(.white)
    }
}
