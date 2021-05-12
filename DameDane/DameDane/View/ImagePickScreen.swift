//
//  ImagePickScreen.swift
//  DameDane
//
//  Created by 박종호 on 2021/05/09.
//

import SwiftUI

struct ImagePickScreen: View {
    var body: some View {
        VStack{
            HStack{
                Text("단계").BinggraeFont(style: .title1, weight: .bold).padding(.init(top: 0, leading: 16, bottom: 8, trailing: 16))
                Spacer()
            }
            HStack{
                
                Image(systemName: "1.circle").padding()
                
                Text("먼저, 이미지 크롭 사이트로 가셔서\n합성할 사진을 256 * 256 사이즈로\n기기에 저장해주세요").lineSpacing(5).BinggraeFont(style: .caption1, weight: .regular)
                Spacer()
                Link(destination: URL(string:"https://www.kapwing.com/studio")!){
                    VStack{
                        Image(systemName: "paperplane").imageScale(.large).foregroundColor(Color("lightBlue"))
                        Text("바로가기").foregroundColor(Color("lightBlue"))
                    }
                }
                Spacer()
            }.padding(.init(top: 32, leading: 0, bottom: 0, trailing: 0))
            HStack{
                Image(systemName: "2.circle").padding()
                Text("256 * 256 해상도의 사진을\n아래 버튼을 눌러 골라주세요.").BinggraeFont(style: .caption1, weight: .regular)
                Spacer()
            }.padding(.top,50)
            Button(action:{
                imagePick()
            }){
                ZStack{
                    RoundedRectangle(cornerRadius: 0).strokeBorder(Color.gray,lineWidth: 1)
                        .frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                        .foregroundColor(Color("lightBlue"))
                }.padding().padding(.top,50)
            }
            Text("반드시 256 * 256 사이즈의 사진을 골라주세요!").BinggraeFont(style: .caption2, weight: .regular)
            Spacer()
        }
    }
}

struct ImagePickScreen_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickScreen()
    }
}

public func imagePick() -> Void {
    
}
