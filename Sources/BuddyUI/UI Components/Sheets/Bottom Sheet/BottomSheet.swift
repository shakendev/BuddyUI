//
//  BottomSheet.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - BottomSheet

@available(iOS 18.0, *)
struct BottomSheet<Content: View>: View {

    // MARK: - Public typealiases

    typealias Action = () -> Void



    // MARK: - Private properties

    @Binding private var isPresented: Bool
    private let content: Content
    private let action: Action

    @State private var isShowed = false
    @State private var yOffset: CGFloat = .zero



    // MARK: - Body

    var body: some View {
        Color.black.opacity(0.6)
            .opacity(isShowed ? 1 : .zero)
            .onTapGesture { hide() }
            .overlay(alignment: .bottom) {
                if isShowed {
                    content
                        .offset(y: yOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.startLocation.y < gesture.location.y {
                                        yOffset = gesture.translation.height
                                    }
                                }
                                .onEnded { gesture in
                                    if gesture.translation.height > 100 { hide() }
                                }
                        )
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .bottom),
                                removal: .move(edge: .bottom)
                            )
                        )
                }
            }
            .ignoresSafeArea()
            .onChange(of: isPresented) { _, isNewPresented in
                if !isNewPresented { hide(isShowed: isNewPresented) }
            }
            .onAppear(perform: show)
    }



    // MARK: - Init

    init(
        isPresented: Binding<Bool>,
        content: () -> Content,
        action: @escaping Action
    ) {
        _isPresented = isPresented
        self.content = content()
        self.action = action
    }



    // MARK: - Private functions

    private func hide(isShowed: Bool = false) {
        withAnimation(.interactiveSpring(duration: 0.4)) {
            self.isShowed = isShowed
        } completion: {
            isPresented = isShowed

            action()
        }
    }

    private func show() {
        withAnimation(.interactiveSpring(duration: 0.4)) {
            isShowed = isPresented
        }
    }
}
