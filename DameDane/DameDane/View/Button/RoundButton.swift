//
//  RoundButton.swift
//  DameDane
//
//  Created by 박종호 on 2021/05/09.
//

import SwiftUI

struct RoundButton<TextToShow:View>: View {
    let textToShow:TextToShow
    //Text를 넘겨 RoundButton을 생성할 수 있음
    var color:Color = Color("lightBlue")
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30).foregroundColor(color)
            textToShow.AutoSizeBinggraeFont(weight: .medium, textColor: .white, fontForWhat: .Body)
        }
    }
    mutating func changeColor(color:Color){
        self.color = color
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton(textToShow: Text("버튼입니다"))
    }
}
