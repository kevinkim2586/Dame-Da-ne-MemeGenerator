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
    var textColor: Color
    
    init(style:UIFont.TextStyle,weight:Font.Weight,textColor:Color) {
        self.style = style
        self.weight = weight
        self.textColor = textColor
    }
    
    init(weight:Font.Weight,textColor:Color,fontForWhat:FontForWhat){
        self.style = .body
        self.weight = weight
        self.textColor = textColor
        self.style = autoStyle(fontForWhat: fontForWhat)
    }
    
    func body(content: Content) -> some View {
        switch  weight {
        case Font.Weight.bold:
            return content.font(Font.custom("Binggrae-Bold", size: UIFont.preferredFont(forTextStyle: style).pointSize).weight(weight)).foregroundColor(textColor)
        case Font.Weight.medium:
            return content.font(Font.custom("Binggrae", size: UIFont.preferredFont(forTextStyle: style).pointSize).weight(weight)).foregroundColor(textColor)
        default:
            return content.font(Font.custom("Binggrae", size: UIFont.preferredFont(forTextStyle: style).pointSize).weight(weight)).foregroundColor(textColor)
        }
    }
    /**
     아이폰 기종 별로 알맞은 텍스트 사이즈를 반환하는 함수입니다.
     ---
     - Parameters:
     - fontForWhat: 텍스트가 사용될 용도 (열거형)
     - Returns: UIFont.TextStyle 의 한 종류가 반환됨
     */
    mutating func autoStyle(fontForWhat:FontForWhat) -> UIFont.TextStyle{
        let bounds: CGRect = UIScreen.main.bounds
        let height = bounds.height
        
        switch height {
        case 896...950:
            switch fontForWhat {
            case FontForWhat.Title:
                return UIFont.TextStyle.title1
            case FontForWhat.Body:
                return UIFont.TextStyle.title3
            case FontForWhat.Caption:
                return UIFont.TextStyle.footnote
            }
        case 844...895:
            switch fontForWhat {
            case FontForWhat.Title:
                return UIFont.TextStyle.title2
            case FontForWhat.Body:
                return UIFont.TextStyle.body
            case FontForWhat.Caption:
                return UIFont.TextStyle.caption1
            }
        case 780...812:
            switch fontForWhat {
            case FontForWhat.Title:
                return UIFont.TextStyle.title3
            case FontForWhat.Body:
                return UIFont.TextStyle.footnote
            case FontForWhat.Caption:
                return UIFont.TextStyle.caption2
            }
        case 0...779:
            switch fontForWhat {
            case FontForWhat.Title:
                return UIFont.TextStyle.title3
            case FontForWhat.Body:
                return UIFont.TextStyle.caption1
            case FontForWhat.Caption:
                return UIFont.TextStyle.caption2
            }
        default:
            return UIFont.TextStyle.body
        }
        
    }
}
extension View{
    func cuteFont(style: UIFont.TextStyle, weight: Font.Weight) -> some View {
        self.modifier(cuteFontModifier(style: style, weight: weight))
    }
    /**
     텍스트 사이즈를 알아서 정해줘야하는 함수
     */
    func BinggraeFont(style: UIFont.TextStyle, weight: Font.Weight,textColor:Color) -> some View {
        self.modifier(BinggraeModifier(style: style, weight: weight,textColor: textColor))
    }
    /**
      텍스트가 표시될 부분을 정해주면 알아서 폰트 사이즈를 정해주는 함수
     */
    func AutoSizeBinggraeFont(weight: Font.Weight, textColor:Color, fontForWhat:FontForWhat) -> some View{
        self.modifier(BinggraeModifier(weight: weight, textColor: textColor, fontForWhat: fontForWhat))
    }
}
/**
 텍스트가 사용될 용도를 열거형으로 나열
 */
enum FontForWhat {
    case Title
    case Body
    case Caption
}
