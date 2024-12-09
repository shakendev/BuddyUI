//
//  BubbleText.Style.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - BubbleText.Style

extension BubbleText {

    // MARK: - Public structures

    ///
    ///
    ///
    public struct Style {

        // MARK: - Private properties

        let color: Color

        let radius: CGFloat

        let font: UIFont

        let shadow0: Shadow
        let shadow1: Shadow



        // MARK: - Init

        ///
        ///
        ///
        public init(
            color: Color = .primary,
            blur radius: CGFloat = .zero,
            font: UIFont = .systemFont(ofSize: 15),
            shadow0: Shadow = .init(),
            shadow1: Shadow = .init()
        ) {
            self.color = color
            self.radius = radius
            self.font = font
            self.shadow0 = shadow0
            self.shadow1 = shadow1
        }
    }
}
