//
//  DescriptionScreen.swift
//  DameDane
//  다메다네 밈, 딥페이크 기술을 설명하는 화면
//  Created by 박종호 on 2021/05/09.
//

import SwiftUI

struct DescriptionScreen: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "questionmark.circle").imageScale(.large).padding()
                Spacer()
            }
            HStack{
                Text("다메다네 밈이란?").cuteFont(style: .largeTitle, weight: .regular).padding(.leading,20)
             Spacer()
            }
            Text("최근에 커뮤니티나 인터넷에 보면 \"다메다네~ 다메요 다메다노요~\" 라며 노래를 부르는 것에 어떤 대상을 허접하게 딥페이크하는 영상이 인기를 끌고 있다.").multilineTextAlignment(.center).padding(.all,20).cuteFont(style: .title1, weight: .regular)
            Text("유튜브 링크 구현 안함").padding()
            HStack{
                Text("딥페이크란?").cuteFont(style: .largeTitle, weight: .regular).padding(.leading,20).padding(.top,70)
                Spacer()
            }
            
        
            Text("흔히 Deep Fake 이라고 부르는 것은 AI 기술을 통해서 기존에 있던 영상의 인물의 모습을 제 3자의 것으로 치환하는 기술을 의미한다.").padding(.all,20).cuteFont(style: .title1, weight: .regular).foregroundColor(.black)
            Spacer()
            
        }
    }
}

struct DescriptionScreen_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionScreen()
    }
}
