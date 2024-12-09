//
//  TrackedScrollView.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - TrackedScrollView

///
///
///
@available(iOS 18.0, *)
public struct TrackedScrollView<SelectionValue: Hashable, Content: View>: View {

    // MARK: - Private properties

    private let axis: Axis.Set
    private let anchor: UnitPoint

    @Binding private var selectedValue: SelectionValue
    @State private var currentValue: SelectionValue?

    private let content: Content



    // MARK: - Body

    public var body: some View {
        ScrollView(axis) {
            stackView
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

private extension TrackedScrollView {
    @ViewBuilder var stackView: some View {
        switch axis {
        case .horizontal:
            LazyHStack(spacing: .zero) {
                content
                    .clipped()
            }
            .scrollTargetLayout()
        default:
            LazyVStack(spacing: .zero) {
                content
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
        TrackedScrollView(axis: .horizontal, selection: $selectedIndex) {
            ForEach(.zero ..< 40, id: \.self) { index in
                Text("Index = \(index)")
                    .foregroundStyle(selectedIndex == index ? .orange : .yellow)
                    .padding()
                    .onTapGesture {
                        selectedIndex = index
                    }
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
