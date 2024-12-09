//
//  BlurView.TransparentView.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - BlurView.TransparentView

extension BlurView {

    // MARK: - Public structures

    struct TransparentView: UIViewRepresentable {

        // MARK: - Private properties

        private let blurEffect = UIBlurEffect()
        private let visualEffectView = UIVisualEffectView()

        private let propertyAnimator = UIViewPropertyAnimator()



        // MARK: - Public methods

        func makeUIView(context: Context) -> some UIView {
            propertyAnimator.addAnimations { visualEffectView.effect = blurEffect }
            propertyAnimator.fractionComplete = .zero
            propertyAnimator.stopAnimation(false)
            propertyAnimator.finishAnimation(at: .current)

            return visualEffectView
        }

        func updateUIView(_ uiView: UIViewType, context: Context) { }
    }
}
