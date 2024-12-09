//
//  BubbleButton.CustomStyle.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - BubbleButton.CustomStyle

extension BubbleButton {

    // MARK: - Public structures

    struct CustomStyle: ButtonStyle {

        // MARK: - Private properties

        private let style: BubbleButton<EmptyView>.Style



        // MARK: - Init

        init(style: BubbleButton<EmptyView>.Style) {
            self.style = style
        }



        // MARK: - Public methods

        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? .init(width: 0.975, height: 0.975) : .identity)
                .blur(radius: configuration.isPressed ? 1 : .zero)
                .animation(.bouncy(duration: 0.3, extraBounce: 0.3).delay(0.1), value: configuration.isPressed)
                .padding(12)
                .background {
                    BlurView(radius: style.radius)
                        .overlay {
                            LinearGradient(
                                stops: [
                                    .init(color: style.color.opacity(0.1), location: 0),
                                    .init(color: style.color.opacity(0.2), location: 0.3),
                                    .init(color: style.color.opacity(0.4), location: 1)
                                ],
                                startPoint: .init(x: 0.2, y: 0),
                                endPoint: .init(x: 0.3, y: 1)
                            )
                        }
                }
                .overlay {
                    Capsule()
                        .stroke(.white, lineWidth: style.shadow0.width)
                        .offset(x: style.shadow0.offset.x, y: style.shadow0.offset.y)
                        .blur(radius: style.shadow0.radius)
                }
                .overlay {
                    Capsule()
                        .stroke(style.color, lineWidth: style.shadow1.width)
                        .offset(x: style.shadow1.offset.x, y: style.shadow1.offset.y)
                        .blur(radius: style.shadow1.radius)
                }
                .overlay {
                    LinearGradient(
                        stops: [
                            .init(color: .white.opacity(0.1), location: 0),
                            .init(color: style.color.opacity(0.15), location: 0.7),
                            .init(color: style.color.opacity(0.25), location: 1)
                        ],
                        startPoint: .init(x: 0.2, y: 0),
                        endPoint: .init(x: 0.3, y: 1)
                    )
                }
                .clipShape(.capsule)
                .scaleEffect(configuration.isPressed ? .init(width: 0.95, height: 0.95) : .identity)
                .animation(.bouncy(duration: 0.3, extraBounce: 0.1), value: configuration.isPressed)
        }
    }
}
