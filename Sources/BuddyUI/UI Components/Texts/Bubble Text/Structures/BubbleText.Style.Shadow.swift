//
//  BubbleText.Style.Shadow.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - BubbleText.Style.Shadow

extension BubbleText.Style {

    // MARK: - Public structures

    ///
    ///
    ///
    public struct Shadow {

        // MARK: - Private properties
        
        let color: Color

        let width: CGFloat

        let radius: CGFloat

        let offset: Offset



        // MARK: - Init

        ///
        ///
        ///
        public init(
            color: Color = .primary,
            width: CGFloat = .zero,
            radius: CGFloat = .zero,
            offset: Offset = .init()
        ) {
            self.color = color
            self.width = width
            self.radius = radius
            self.offset = offset
        }
    }
}
