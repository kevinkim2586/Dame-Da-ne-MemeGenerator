//
//  ImagePickScreen.swift
//  DameDane
//
//  Created by 박종호 on 2021/05/09.
//

import SwiftUI

struct ImagePickScreen: View {
    @State var isProgress:Bool = false
    @State private var progress = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
            HStack{
                Text("단계").BinggraeFont(style: .title1, weight: .bold).padding(.init(top: 0, leading: 16, bottom: 8, trailing: 16))
                Spacer()
            }
            HStack{
                Image(systemName: "1.circle").padding()
                Text("먼저, 이미지 크롭 사이트로 가셔서 합성할 사진을 256 * 256 사이즈로 기기에 저장해주세요").lineSpacing(5).BinggraeFont(style: .callout, weight: .regular).multilineTextAlignment(.leading)
                Spacer()
                
            }.padding(.init(top: 16, leading: 0, bottom: 0, trailing: 0))
            Link(destination: URL(string:"https://www.kapwing.com/studio")!){
                HStack{
                    Image(systemName: "paperplane").imageScale(.medium).foregroundColor(Color("lightBlue")).padding()
                    Text("바로가기").BinggraeFont(style: .title3, weight: .regular)
                    Spacer()
                }
            }.padding(.top,10)
            HStack{
                Image(systemName: "2.circle").padding()
                Text("256 * 256 해상도의 사진을 아래 버튼을 눌러 골라주세요.").BinggraeFont(style: .callout, weight: .regular)
                Spacer()
            }.padding(.top,10)
            Button(action:{
                imagePick()
            }){
                ZStack{
                    RoundedRectangle(cornerRadius: 0).strokeBorder(Color.gray,lineWidth: 1)
                        .frame(width: 170, height: 170, alignment: .center)
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                        .foregroundColor(Color("lightBlue"))
                }.padding().padding(.top,20)
            }
            Text("반드시 256 * 256 사이즈의 사진을 골라주세요!").BinggraeFont(style: .caption2, weight: .regular)
            Spacer()
            
            /**
             알맞은 해상도의 사진을 선택했을 시 변환 버튼을 활성화 시킨다
             사진을 담당하는 모델 구현 필요 및, 해상도 확인 함수 구현 필요
             */
            if true {
                
                GeometryReader{ geometry in
                    if !isProgress{
                        ZStack{
                            Button(action:{isProgress.toggle()}){
                                RoundButton(textToShow: Text("변환하기"))
                                    .frame(width:geometry.size.width*0.7,height:geometry.size.height*0.45)
                            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                    }
                    else {
                        ProgressView("Downloading", value: progress)
                            .onReceive(timer){
                                _ in
                                if progress < 100 {
                                    progress += 0.02
                                }
                            }
                    }
                }
            }
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
