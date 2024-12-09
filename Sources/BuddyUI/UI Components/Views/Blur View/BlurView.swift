//
//  BlurView.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - BlurView

///
///
///
@available(iOS 18.0, *)
public struct BlurView: View {

    // MARK: - Private properties

    private let radius: CGFloat
    private let isEdgesSmoothed: Bool



    // MARK: - Body

    public var body: some View {
        TransparentView()
            .blur(radius: radius, opaque: !isEdgesSmoothed)
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        radius: CGFloat,
        isEdgesSmoothed: Bool = false
    ) {
        self.radius = radius
        self.isEdgesSmoothed = isEdgesSmoothed
    }
}



// MARK: -  Live Preview

#Preview {
    VStack {
        Text("BlurView")
            .font(.system(size: 30))
            .overlay {
                BlurView(radius: 10, isEdgesSmoothed: true)
            }

        Text("BlurView")
            .font(.system(size: 30))
            .overlay {
                BlurView(radius: 5, isEdgesSmoothed: false)
            }
    }
}
