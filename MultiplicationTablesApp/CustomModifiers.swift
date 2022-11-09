//
//  CustomModifiers.swift
//  MultiplicationTablesApp
//
//  Created by Romy Shvagir
//

import Foundation
import SwiftUI

struct RoundedRectangleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(25)
            .frame(width: 140, height: 150)
    }
}

struct SignModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding(12)
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.white)
            .padding(5)
            .padding(.horizontal, 20)
            .background(
            Capsule()
                .stroke(Color.white, lineWidth: 2.0)
            )
    }
}

struct PlusMinusModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .frame(height: 25)
            .frame(maxWidth: .infinity)
    }
}
