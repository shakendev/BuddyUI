//
//  BottomSheet+.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 11.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - View+

@available(iOS 18.0, *)
extension View {
    public func bottomSheet2<Content: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: () -> Content
    ) -> some View {
        self.overlay {
            if isPresented.wrappedValue {
                BottomSheet(isPresented: isPresented, content: content)
            }
        }
    }
}
