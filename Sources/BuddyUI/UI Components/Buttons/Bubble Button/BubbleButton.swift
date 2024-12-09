//
//  BubbleButton.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - BubbleButton

///
///
///
@available(iOS 18.0, *)
public struct BubbleButton<Label: View>: View {

    // MARK: - Public typealiases

    public typealias Action = () -> Void



    // MARK: - Private properties

    private let action: Action

    private let label: Label

    @Environment(\.bubbleButtonStyle) private var bubbleButtonStyle



    // MARK: - Body

    public var body: some View {
        Button(action: action) {
            label
        }
        .buttonStyle(CustomStyle(style: bubbleButtonStyle))
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        action: @escaping Action,
        @ViewBuilder label: () -> Label
    ) {
        self.action = action
        self.label = label()
    }
}



// MARK: - Live Preview

#Preview {
    Image("Background", bundle: .module)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .ignoresSafeArea()
        .overlay {
            HStack {
                BubbleButton { } label: {
                    HStack(spacing: 10) {
                        BubbleImage(systemName: "swift")
                            .bubbleImageStyle(
                                .init(
                                    color: .orange.opacity(0.4),
                                    blur: 5,
                                    shadow0: .init(color: .white.opacity(0.8), radius: 1, offset: .init(x: 2, y: 2)),
                                    shadow1: .init(color: .orange.opacity(0.7), radius: 1, offset: .init(x: -2, y: -2))
                                )
                            )
                            .frame(height: 30)

                        BubbleText("Journey")
                            .bubbleTextStyle(
                                .init(
                                    color: .orange.opacity(0.4),
                                    blur: 5,
                                    font: .init(name: "Arial Rounded MT Bold", size: 30)!,
                                    shadow0: .init(color: .white, width: 3, radius: 1, offset: .init(x: 1, y: 1)),
                                    shadow1: .init(color: .orange, width: 3, radius: 1, offset: .init(x: -0.5, y: -0.5))
                                )
                            )
                    }
                }
                .bubbleButtonStyle(
                    .init(
                        color: .yellow.opacity(0.3),
                        blur: 3,
                        shadow0: .init(
                            blur: 5,
                            width: 3,
                            offset: .init(x: 2, y: 2)
                        ),
                        shadow1: .init(
                            blur: 5,
                            width: 4,
                            offset: .init(x: -5, y: -5)
                        )
                    )
                )
                .shadow(color: .black.opacity(0.5), radius: 5, y: 5)

                BubbleButton { } label: {
                    BubbleImage(systemName: "gearshape.fill")
                        .bubbleImageStyle(
                            .init(
                                color: .black.opacity(0.6),
                                blur: 5,
                                shadow0: .init(color: .white.opacity(0.5), radius: 2, offset: .init(x: 2, y: 2)),
                                shadow1: .init(color: .black.opacity(0.7), radius: 2, offset: .init(x: -2, y: -2))
                            )
                        )
                        .frame(height: 30)
                }
                .bubbleButtonStyle(
                    .init(
                        color: .black.opacity(0.5),
                        blur: 3,
                        shadow0: .init(
                            blur: 3,
                            width: 3,
                            offset: .init(x: 2, y: 2)
                        ),
                        shadow1: .init(
                            blur: 3,
                            width: 3,
                            offset: .init(x: -2, y: -2)
                        )
                    )
                )
                .shadow(color: .black.opacity(0.8), radius: 5, y: 5)
            }
        }
}

