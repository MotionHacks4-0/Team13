//
//  SFProDisplayFontModifier.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 30/04/25.
//

import SwiftUI

struct SFProDisplayFontModifier: ViewModifier {
    var weight: Font.Weight = .regular
    var size: CGFloat = 17

    func body(content: Content) -> some View {
        let fontName = fontNameForWeight(weight)
        return content.font(.custom(fontName, size: size))
    }

    private func fontNameForWeight(_ weight: Font.Weight) -> String {
        switch weight {
        case .thin:
            return "SFProDisplay-Thin"
        case .light:
            return "SFProDisplay-Light"
        case .regular:
            return "SFProDisplay-Regular"
        case .medium:
            return "SFProDisplay-Medium"
        case .semibold:
            return "SFProDisplay-Semibold"
        case .bold:
            return "SFProDisplay-Bold"
        case .heavy:
            return "SFProDisplay-Heavy"
        case .black:
            return "SFProDisplay-Black"
        default:
            return "SFProDisplay-Regular"
        }
    }
}

extension View {
    func sfProDisplayFont(weight: Font.Weight = .regular, size: CGFloat = 17) -> some View {
        self.modifier(SFProDisplayFontModifier(weight: weight, size: size))
    }
}


