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
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30).foregroundColor(Color("lightBlue"))
            textToShow.foregroundColor(.white).cuteFont(style: .largeTitle, weight: .regular)
        }
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton(textToShow: Text("버튼입니다"))
    }
}
