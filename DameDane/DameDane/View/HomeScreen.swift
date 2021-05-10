//
//  ContentView.swift
//  DameDane
//  홈화면
//  ? 아이콘을 클릭해 어플리케이션 가이드 화면으로 이동
//  Created by 박종호 on 2021/05/09.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView{
            GeometryReader{geometry in
            VStack(alignment:.center){
                
                Text("다메다네 밈 만들기!").BinggraeFont(style: .title1, weight: .bold)
                Spacer().frame(height:geometry.size.height*0.07)
                Image("GuideImage").resizable().aspectRatio(contentMode: .fit)
                Spacer()
                //이미지 선택 화면으로 이동하는 NavigationLink
                NavigationLink(destination:ImagePickScreen()){
                    RoundButton(textToShow:Text("시작하기"))
                }.frame(width:geometry.size.width*0.7,height: geometry.size.height*0.07)
                
                Spacer().frame(height:geometry.size.height*0.15)
                
            }.frame(width: geometry.size.width, height: geometry.size.height)
            //어플리케이션 설명 화면으로 이동하는 NavigationLink
            .navigationBarItems(leading: NavigationLink(destination:DescriptionScreen()){
                Image(systemName: "questionmark.circle.fill").imageScale(.large).foregroundColor(Color("lightBlue"))
            })
        }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
