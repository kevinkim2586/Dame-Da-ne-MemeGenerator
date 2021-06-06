//
//  ErrorScreen.swift
//  DameDane
//
//  Created by 박종호 on 2021/06/06.
//

import SwiftUI

struct ErrorScreen: View {
    @Binding var errorOccured:Bool
    @ObservedObject var imageManagerViewModel:ImageManagerViewModel
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Text("에러가 발생했습니다").AutoSizeBinggraeFont(weight: .bold, textColor: .red, fontForWhat: .Title)
                ZStack{
                    if let image = imageManagerViewModel.getCurrentImage() {
                        Image(uiImage: image)
                    }
                    Image(systemName: "xmark.octagon").resizable().frame(width: 256, height: 256, alignment: .center).foregroundColor(.pink)
                }.padding()
                Spacer()
                Text("네트워크 상황을 확인한 뒤\n다시 시도해 주세요").multilineTextAlignment(.center).AutoSizeBinggraeFont(weight: .medium, textColor: .black, fontForWhat: .Body)
                Button(action:{
                    errorOccured.toggle()
                }){
                    RoundButton(textToShow: Text("확인")).frame(width: geometry.size.width*0.7, height: geometry.size.height*0.07, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding()
                }
                Spacer()
            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
}

struct ErrorScreen_Previews: PreviewProvider {
    static var previews: some View {
        ErrorScreen(errorOccured: .constant(true),imageManagerViewModel: ImageManagerViewModel())
    }
}
