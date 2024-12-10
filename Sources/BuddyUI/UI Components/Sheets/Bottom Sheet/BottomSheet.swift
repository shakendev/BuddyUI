//
//  BottomSheet.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 11.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - BottomSheet

@available(iOS 18.0, *)
struct BottomSheet<Content: View>: View {

    // MARK: - Private properties

    @Binding private var isPresented: Bool
    private let content: Content

    @State private var isShowed = false
    @State private var offset: CGFloat = .zero



    // MARK: - Body

    var body: some View {
        BlurView(radius: isShowed ? 5 : .zero)
            .overlay {
                Color.black.opacity(0.5)
                    .opacity(isShowed ? 1 : .zero)
            }
            .onTapGesture {
                withAnimation(.interactiveSpring(duration: 0.3)) {
                    isShowed = false
                } completion: {
                    isPresented = isShowed
                }
            }
            .overlay(alignment: .bottom) {
                if isShowed {
                    content
                        .offset(y: offset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.startLocation.y < gesture.location.y {
                                        offset = gesture.translation.height
                                    }
                                }
                                .onEnded { gesture in
                                    if gesture.translation.height > 50 { hide() } else { resetOffset() }
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
        content: () -> Content
    ) {
        _isPresented = isPresented
        self.content = content()
    }



    // MARK: - Private functions

    private func hide(isShowed: Bool = false) {
        withAnimation(.interactiveSpring(duration: 0.4)) {
            self.isShowed = isShowed
        } completion: {
            isPresented = isShowed
        }
    }

    private func show() {
        withAnimation(.interactiveSpring(duration: 0.4)) {
            isShowed = isPresented
        }
    }

    private func resetOffset() {
        withAnimation(.interactiveSpring(duration: 0.4)) {
            offset = .zero
        }
    }
}
