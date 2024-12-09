//
//  PagedScrollView.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - PagedScrollView

///
///
///
@available(iOS 18.0, *)
public struct PagedScrollView<SelectionValue: Hashable, Content: View>: View {

    // MARK: - Private properties

    private let axis: Axis.Set
    private let anchor: UnitPoint

    @Binding private var selectedValue: SelectionValue
    @State private var currentValue: SelectionValue?

    private let content: Content



    // MARK: - Body

    public var body: some View {
        GeometryReader { geometry in
            let size = geometry.size

            ScrollView(axis) {
                stackView(with: size)
            }
            .scrollBounceBehavior(.basedOnSize)
            .scrollPosition(id: $currentValue, anchor: anchor)
            .onChange(of: currentValue) { _, newValue in
                guard let newValue else { return }

                selectedValue = newValue
            }
            .onChange(of: selectedValue) {
                currentValue = selectedValue
            }
            .onAppear {
                currentValue = selectedValue
            }
            .animation(.smooth, value: currentValue)
        }
        .scrollTargetBehavior(.paging)
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        axis: Axis.Set = .vertical,
        anchor: UnitPoint = .center,
        selection: Binding<SelectionValue>,
        @ViewBuilder content: () -> Content
    ) {
        self.axis = axis
        self.anchor = anchor
        _selectedValue = selection
        self.content = content()
    }
}



// MARK: - UI

private extension PagedScrollView {
    @ViewBuilder private func stackView(with size: CGSize) -> some View {
        switch axis {
        case .horizontal:
            LazyHStack(spacing: .zero) {
                content
                    .frame(width: size.width, height: size.height)
                    .clipped()
            }
            .scrollTargetLayout()
        default:
            LazyVStack(spacing: .zero) {
                content
                    .frame(width: size.width, height: size.height)
                    .clipped()
            }
            .scrollTargetLayout()
        }
    }
}



// MARK: - Live Preview

#Preview {
    @Previewable @State var selectedIndex: Int = .zero

    VStack {
        PagedScrollView(axis: .horizontal, selection: $selectedIndex) {
            ForEach(.zero ..< 40, id: \.self) { index in
                Text("Index = \(index)")
                    .foregroundStyle(selectedIndex == index ? .orange : .yellow)
                    .padding()
            }
        }
        .background(.red)

        TrackedScrollView(axis: .vertical, selection: $selectedIndex) {
            ForEach(.zero ..< 40, id: \.self) { index in
                Text("Index = \(index)")
                    .padding()
            }
        }
        .background(.green)
    }
}
