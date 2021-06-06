//
//  ConvertImageScreen.swift
//  DameDane
//
//  Created by 박종호 on 2021/05/19.
//

import SwiftUI

struct ConvertImageScreen: View {
    @Binding var isProgress:Bool
    @Binding var isComplete:Bool
    @State var progressPercent = 0.0
    @State var showText:Bool = true
    @Binding var isProgressComplete:Bool
    @ObservedObject var imageManagerViewModel:ImageManagerViewModel
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    let textAnimationTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack{
            Spacer()
            Text("변환 작업이 진행중입니다!").AutoSizeBinggraeFont(weight: .bold, textColor: .black, fontForWhat: .Title)
            if let currentUiImage = imageManagerViewModel.getCurrentImage(){
                Image(uiImage: currentUiImage)
            }
            Spacer()
            ProgressView(value: progressPercent, total: 100.0).progressViewStyle(CustomProgressViewStyle()).frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).onReceive(timer, perform: { _ in
                if progressPercent < 100 && !isProgressComplete{
                    progressPercent += 0.1
                }
                else if progressPercent<100 && isProgressComplete{
                    progressPercent+=1
                }
                else if progressPercent>100 && isProgressComplete{
                    isComplete.toggle()
                }
            })
            Spacer()
            ZStack{
                Text("1").AutoSizeBinggraeFont(weight: .medium, textColor: .white, fontForWhat: .Body)
                if showText {
                    
                    Text("작업 중엔 홈 버튼을 누르지 마세요!").AutoSizeBinggraeFont(weight: .medium, textColor: .pink, fontForWhat: .Body)
                }
            }.onReceive(textAnimationTimer, perform: { _ in
                withAnimation{
                    self.showText.toggle()
                }
            })
            Spacer()
        }
    }
}

struct ConvertImageScreen_Previews: PreviewProvider {
    static var previews: some View {
        ConvertImageScreen(isProgress: .constant(true), isComplete: .constant(true), isProgressComplete: .constant(false), imageManagerViewModel: ImageManagerViewModel())
    }
}
