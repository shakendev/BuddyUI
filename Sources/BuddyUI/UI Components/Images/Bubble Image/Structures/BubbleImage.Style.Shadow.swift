//
//  BubbleImage.Style.Shadow.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - BubbleImage.Style.Shadow

extension BubbleImage.Style {

    // MARK: - Public structures

    ///
    ///
    ///
    public struct Shadow {

        // MARK: - Public properties

        let color: Color

        let radius: CGFloat
        
        let offset: Offset



        // MARK: - Init

        ///
        ///
        ///
        public init(
            color: Color = .primary,
            radius: CGFloat = .zero,
            offset: Offset = .init()
        ) {
            self.color = color
            self.radius = radius
            self.offset = offset
        }
    }
}
