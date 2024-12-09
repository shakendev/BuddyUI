//
//  BubbleButton.Style.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - BubbleButton.Style

extension BubbleButton {

    // MARK: - Public structures

    ///
    ///
    ///
    public struct Style {

        // MARK: - Public properties

        let color: Color

        let radius: CGFloat

        let shadow0: Shadow
        let shadow1: Shadow



        // MARK: - Init

        ///
        ///
        ///
        public init(
            color: Color = .primary,
            blur radius: CGFloat = .zero,
            shadow0: Shadow = .init(),
            shadow1: Shadow = .init()
        ) {
            self.color = color
            self.radius = radius
            self.shadow0 = shadow0
            self.shadow1 = shadow1
        }
    }
}
