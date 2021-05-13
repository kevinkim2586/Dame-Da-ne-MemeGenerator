//
//  CustomFontHandler.swift
//  DameDane
//
//  Created by 박종호 on 2021/05/09.
//

import SwiftUI

struct cuteFontModifier: ViewModifier {
    
    var style: UIFont.TextStyle = .body
    var weight: Font.Weight = .regular
    
    var textColor: Color {
        switch style {
        case .title1:
            return .black
        case .caption1:
            return Color.black.opacity(0.8)
        default:
            return .black
        }
    }
    
    func body(content: Content) -> some View {
        content
            .font(Font.custom("CuteFont-Regular", size: UIFont.preferredFont(forTextStyle: style).pointSize)
                    .weight(weight))
            .foregroundColor(textColor)
    }
    
}
struct BinggraeModifier: ViewModifier {
    
    var style: UIFont.TextStyle = .body
    var weight: Font.Weight = .regular
    
    var textColor: Color {
        switch style {
        case .title1:
            return .black
        case .caption1:
            return Color.black.opacity(0.8)
        case .title3:
            return Color("lightBlue")
        default:
            return .black
        }
    }
    
    func body(content: Content) -> some View {
        if weight == .regular{
            content
                .font(Font.custom("Binggrae", size: UIFont.preferredFont(forTextStyle: style).pointSize)
                        .weight(weight))
                .foregroundColor(textColor)
        }
        else if weight == .bold{
            content
                .font(Font.custom("Binggrae-Bold", size: UIFont.preferredFont(forTextStyle: style).pointSize)
                        .weight(weight))
                .foregroundColor(textColor)
        }
    }
    
}
extension View{
    func cuteFont(style: UIFont.TextStyle, weight: Font.Weight) -> some View {
        self.modifier(cuteFontModifier(style: style, weight: weight))
    }
    func BinggraeFont(style: UIFont.TextStyle, weight: Font.Weight) -> some View {
        self.modifier(BinggraeModifier(style: style, weight: weight))
    }
}
