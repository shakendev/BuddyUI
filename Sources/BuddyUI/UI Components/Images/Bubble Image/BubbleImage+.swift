//
//  BubbleImage+.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - EnvironmentValues+

@available(iOS 18.0, *)
extension EnvironmentValues {

    // MARK: - Public properties

    @Entry var bubbleImageStyle: BubbleImage.Style = .init()
}



// MARK: - View+

@available(iOS 18.0, *)
extension View {

    // MARK: - Public methods

    ///
    ///
    ///
    public func bubbleImageStyle(_ style: BubbleImage.Style) -> some View {
        environment(\.bubbleImageStyle, style)
    }
}
