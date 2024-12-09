//
//  ProgressiveBlurView.VariableBlurView.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import CoreImage.CIFilterBuiltins
import UIKit



// MARK: - ProgressiveBlurView.VariableBlurView

extension ProgressiveBlurView {

    // MARK: - Public classes

    final class VariableBlurView: UIVisualEffectView {

        // MARK: - Private properties

        private let radius: CGFloat
        private let direction: Direction

        private let context = CIContext()



        // MARK: - Init

        init(
            radius: CGFloat,
            direction: Direction
        ) {
            self.radius = radius
            self.direction = direction

            let blurEffect = UIBlurEffect(style: .regular)

            super.init(effect: blurEffect)
        }

        required init?(coder: NSCoder) {
            fatalError("\(Self.self) doesn;t support XIB layout")
        }



        // MARK: - Overriding parent methods

        override func didMoveToWindow() {
            guard let window, let backdropLayer = subviews.first?.layer else { return }

            backdropLayer.setValue(window.screen.scale, forKey: "scale")
        }

        override func layoutSubviews() {
            super.layoutSubviews()

            guard
                let filter = NSClassFromString("CAFilter") as? NSObject.Type,
                let variableBlur = filter
                    .perform(NSSelectorFromString("filterWithType:"), with: "variableBlur")
                    .takeUnretainedValue() as? NSObject
            else { return }

            let gradientImage = createGradientImage(direction: direction)

            variableBlur.setValue(radius, forKey: "inputRadius")
            variableBlur.setValue(gradientImage, forKey: "inputMaskImage")
            variableBlur.setValue(true, forKey: "inputNormalizeEdges")

            subviews.first?.layer.filters = [variableBlur]

            subviews.dropFirst().forEach { subview in
                subview.alpha = .zero
            }
        }



        // MARK: - Private functions

        private func createGradientImage(direction: Direction) -> CGImage {
            let size: CGFloat = 100

            let filter = CIFilter.smoothLinearGradient()

            filter.color0 = .black
            filter.color1 = .clear

            let points = createPoints(with: size, by: direction)

            filter.point0.x = points.x0
            filter.point1.x = points.x1

            filter.point0.y = points.y0
            filter.point1.y = points.y1

            return context
                .createCGImage(
                    filter.outputImage!,
                    from: .init(x: .zero, y: .zero, width: size, height: size)
                )!
        }

        private func createPoints(
            with size: CGFloat,
            by direction: Direction
        ) -> (
            x0: CGFloat,
            y0: CGFloat,
            x1: CGFloat,
            y1: CGFloat
        ) {
            switch direction {
            case .top: (.zero, .zero, .zero, size)
            case .leading: (size, .zero, .zero, .zero)
            case .trailing: (.zero, .zero, size, .zero)
            case .bottom: (.zero, size, .zero, .zero)
            }
        }
    }
}
