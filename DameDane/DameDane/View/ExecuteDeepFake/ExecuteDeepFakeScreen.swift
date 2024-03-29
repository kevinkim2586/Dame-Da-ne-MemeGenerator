//
//  ImagePickScreen.swift
//  DameDane
//
//  Created by 박종호 on 2021/05/09.
//

import SwiftUI
/**
 상황에 따라 적절한 화면을 송출하는 View
 */
struct ExecuteDeepFakeScreen: View {
    @State var isProgress:Bool = false //변환 로딩 뷰 관련 상태 프로퍼티
    @State var isComplete:Bool = false //변환 완료 뷰 관련 상태 프로퍼티
    @State var isProgressComplete = false
    @State private var progress = 0.0
    @State var errorOccured:Bool = false
    @ObservedObject var imageManagerViewModel = ImageManagerViewModel()
    var body: some View {
        //변환 중 에러가 발생한 경우 에러 화면을 보여준다.
        if errorOccured {
            ErrorScreen(errorOccured: $errorOccured,imageManagerViewModel: imageManagerViewModel).navigationBarBackButtonHidden(true)
        }
        //변환 작업이 실행중이지 않을 경우 설명 화면을 보여준다.
        else if !isProgress && !isComplete{
            DescriptionOfStepView(isProgressConvert: $isProgress,isComplete: $isComplete,imageMangagerViewModel: imageManagerViewModel,errorOccured:$errorOccured,isProgressComplete:$isProgressComplete).navigationBarBackButtonHidden(true)
        }
        //변환 작업이 실행 중일 경우 로딩 화면을 보여준다
        else if isProgress && !isComplete {
            ConvertImageScreen(isProgress: $isProgress, isComplete: $isComplete,isProgressComplete:$isProgressComplete,imageManagerViewModel: imageManagerViewModel).navigationBarBackButtonHidden(true)
        }
        //변환 작업이 완료된 경우 완료 화면을 보여준다
        else {
            CompleteConvertScreen(imageManagerViewModel: imageManagerViewModel).navigationBarBackButtonHidden(true)
        }
        
     }
}

struct ImagePickScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExecuteDeepFakeScreen()
    }
}

