//
//  CompleteConvertScreen.swift
//  DameDane
//
//  Created by 박종호 on 2021/05/22.
//

import SwiftUI

struct CompleteConvertScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack{
            
        }.navigationBarItems(leading: CustomBackButton(presentationMode: self._presentationMode))
    }
}

struct CompleteConvertScreen_Previews: PreviewProvider {
    static var previews: some View {
        CompleteConvertScreen()
    }
}
