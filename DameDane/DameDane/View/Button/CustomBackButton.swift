//
//  CustomBackButton.swift
//  DameDane
//
//  Created by 박종호 on 2021/05/22.
//

import SwiftUI
/**
 Custom 네비게이션 백 버튼
 */
struct CustomBackButton: View {
    
    var buttonAction:()->()

    var body: some View {
        Button(action:
           buttonAction
        ){
            HStack{
                Image(systemName: "arrow.backward").foregroundColor(Color("lightBlue")).imageScale(.large)
                Text("홈으로").AutoSizeBinggraeFont(weight: .medium, textColor: Color("lightBlue"), fontForWhat: .Body)
            }
        }
    }
}

struct CustomBackButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackButton(buttonAction: {})
    }
}
