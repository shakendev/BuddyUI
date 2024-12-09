//
//  BubbleButton+.swift
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

    @Entry var bubbleButtonStyle: BubbleButton<EmptyView>.Style = .init()
}



// MARK: - View+

@available(iOS 18.0, *)
extension View {

    // MARK: - Public methods

    ///
    ///
    ///
    public func bubbleButtonStyle(_ style: BubbleButton<EmptyView>.Style) -> some View {
        environment(\.bubbleButtonStyle, style)
    }
}
