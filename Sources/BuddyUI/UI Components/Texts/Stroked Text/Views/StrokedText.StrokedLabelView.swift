//
//  StrokedText.StrokedLabelView.swift
//  Swift Buddy
//
//  Created by Dimka Novikov on 30.11.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import UIKit



// MARK: - StrokedText.StrokedLabelView

extension StrokedText {

    // MARK: - Public classes

    final class StrokedLabelView: UIView {

        // MARK: - Private properties

        private let label: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.baselineAdjustment = .alignCenters
            label.isUserInteractionEnabled = false
            label.clipsToBounds = false
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()



        // MARK: - Init

        convenience init(
            text: String,
            color: UIColor,
            font: UIFont,
            width: CGFloat
        ) {
            self.init(frame: .zero)

            let textAttributes = [
                NSAttributedString.Key.strokeColor: color,
                NSAttributedString.Key.foregroundColor: UIColor.clear,
                NSAttributedString.Key.strokeWidth: width,
                NSAttributedString.Key.font: font
            ] as [NSAttributedString.Key: Any]

            label.attributedText = .init(string: text, attributes: textAttributes)
        }

        override init(frame: CGRect) {
            super.init(frame: frame)

            setupRootView()
            setupViews()

            computeFrames()
        }

        required init?(coder: NSCoder) {
            fatalError("\(Self.self) doesn't support XIB layout")
        }



        // MARK: - Overriding parent methods

        override func layoutSubviews() {
            super.layoutSubviews()

            computeFrames()
        }



        // MARK: - Private functions

        private func setupRootView() {
            backgroundColor = .clear
        }

        private func setupViews() {
            addSubview(label)
        }

        private func computeFrames() {
            label.frame = bounds
        }
    }
}
