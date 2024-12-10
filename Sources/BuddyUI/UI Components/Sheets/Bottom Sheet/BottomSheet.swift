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
        // FIXME: This event causes removing key window
//            .onTapGesture { hide() }
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



// MARK: - Live Preview

#Preview {
    @Previewable @State var selectedIndex: Int = .zero
    @Previewable @State var isBottomSheetPresented = false

    let count = 10

    VStack(spacing: .zero) {
        HStack {
            Text("Selected Index = \(selectedIndex)")

            Spacer()

            Button("Open Bottom Sheet") {
                isBottomSheetPresented = true
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(.yellow)

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
    .bottomSheet(isPresented: $isBottomSheetPresented) {
        GeometryReader { geometry in
            let size = geometry.size

            VStack(spacing: .zero) {
                Text("Title")
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .trailing) {
                        Button {
                            isBottomSheetPresented = false
                        } label: {
                            Image(systemName: "xmark")
                        }
                        .buttonStyle(.plain)
                    }
                    .foregroundStyle(.black.opacity(0.8))
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.red, lineWidth: 1)
                    }

                List {
                    ForEach(.zero ..< count, id: \.self) { index in
                        Button {
                            selectedIndex = index
                            isBottomSheetPresented = false
                        } label: {
                            Text("Item = \(index)")
                        }
                    }
                }
                .frame(height: count > 6 ? (size.height / 2) : CGFloat(count) * 40 + 100)
            }
            .padding(.bottom, 30)
            .background(.white)
            .clipShape(.rect(cornerRadius: 20))
            .frame(width: size.width, height: size.height, alignment: .bottom)
        }
    }
}
