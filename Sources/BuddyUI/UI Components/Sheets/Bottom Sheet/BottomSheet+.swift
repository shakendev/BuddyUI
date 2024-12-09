//
//  BottomSheet+.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - View+

@available(iOS 18.0, *)
extension View {

    // MARK: - Public methods

    ///
    ///
    ///
    public func bottomSheet<Content: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.onChange(of: isPresented.wrappedValue) {
            guard isPresented.wrappedValue else { return }

            let window = UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first(where: { $0.isKeyWindow })

            if let window {
                let bottomSheet = BottomSheet(isPresented: isPresented, content: content) {
                    window.rootViewController?.children.last?.view.removeFromSuperview()
                    window.rootViewController?.children.last?.removeFromParent()
                }

                let viewController = UIHostingController(rootView: bottomSheet)

                viewController.view.frame = window.rootViewController?.view.bounds ?? .zero
                viewController.view.backgroundColor = .clear
                viewController.view.translatesAutoresizingMaskIntoConstraints = false

                window.rootViewController?.view.addSubview(viewController.view)
                window.rootViewController?.addChild(viewController)
            }
        }
    }
}

