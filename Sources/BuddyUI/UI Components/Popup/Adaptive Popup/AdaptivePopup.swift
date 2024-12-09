//
//  AdaptivePopup.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - AdaptivePopup

@available(iOS 18.0, *)
public struct AdaptivePopup<Content: View>: View {

    // MARK: - Public typealiases

    typealias Action = () -> Void



    // MARK: - Private properties

    @Binding private var isPresented: Bool

    private let background: AdaptivePopupBackground
    private let transition: AdaptivePopupTransition

    private let content: Content
    private let action: Action

    @State private var isShowed = false



    // MARK: - Body

    public var body: some View {
        Group {
            switch background {
            case .clear:
                Color.black.opacity(0.01)
                    .opacity(isShowed ? 1 : .zero)
            case .blur(let radius):
                BlurView(radius: isShowed ? radius : .zero)
            case .fill(let color):
                color
                    .opacity(isShowed ? 1 : .zero)
            }
        }
        .onTapGesture { hide() }
        .overlay {
            switch transition {
            case .center(let scaleFactor):
                contentView(size: scaleFactor)
            case .path(let startPoint, let endPoint, let scaleFactor):
                contentView(size: scaleFactor)
                    .position(isShowed ? endPoint : startPoint)
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
        background: AdaptivePopupBackground,
        transition: AdaptivePopupTransition,
        content: () -> Content,
        action: @escaping Action
    ) {
        _isPresented = isPresented
        self.background = background
        self.transition = transition
        self.content = content()
        self.action = action
    }

    private func hide(isShowed: Bool = false) {
        withAnimation(.bouncy(duration: 0.4)) {
            self.isShowed = isShowed
        } completion: {
            isPresented = isShowed

            action()
        }
    }

    private func show() {
        withAnimation(.bouncy(duration: 0.4)) {
            isShowed = isPresented
        }
    }
}



// MARK: - UI

extension AdaptivePopup {
    @ViewBuilder private func contentView(size: CGSize) -> some View {
        content
            .scaleEffect(isShowed ? .identity : size)
            .opacity(isShowed ? 1 : .zero)
    }
}



// MARK: - Live Preview

#Preview {
    @Previewable @State var isAdaptivePopupPresented = false

    GeometryReader { geometry in
        let size = geometry.size

        VStack(spacing: .zero) {
            Button("Show Adaptive Popup") {
                isAdaptivePopupPresented.toggle()
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding()

            ScrollView(.vertical) {
                LazyVStack(spacing: .zero) {
                    ForEach(.zero ..< 100, id: \.self) { index in
                        Text("Item = \(index)")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                            .background(.black.opacity(0.3))
                            .clipShape(.rect(cornerRadius: 10))
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .overlay(alignment: .bottomTrailing) {
            Image(systemName: "questionmark.bubble.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding()
                .onTapGesture {
                    isAdaptivePopupPresented = true
                }
        }
        .adaptivePopup(
            isPresented: $isAdaptivePopupPresented,
            background: .blur(radius: 20),
            transition: .path(
                from: .init(x: size.width / 1.2, y: size.height),
                to: .init(x: size.width / 2, y: size.height / 1.5),
                scale: .zero
            )
        ) {
            VStack(spacing: 40) {
                VStackLayout(spacing: 20) {
                    Text("Title")

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Description")

                        Text("sdklnglkdfngklfdhnslkgnfjklhgkljfdhskjlghdfsljklhgfdkjg")
                    }
                }

                Button("Close") {
                    isAdaptivePopupPresented = false
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .background(.white)
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal)
            .shadow(color: .black.opacity(0.3), radius: 10, y: 5)
        }
    }
}
