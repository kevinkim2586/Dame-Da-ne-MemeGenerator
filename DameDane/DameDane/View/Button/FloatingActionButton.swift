//
//  FloatingActionButton.swift
//  DameDane
//
//  Created by 박종호 on 2021/05/23.
//

import SwiftUI

struct FloatingActionButton: View {
    var buttonAction:()->()
    
    var body: some View {
        
        Button(action:buttonAction){
            ZStack{
                Circle().foregroundColor(Color("lightBlue"))
                    .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Image(systemName: "house").imageScale(.large).foregroundColor(.white)
            }
            
        }
    }
}

struct FloatingActionButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingActionButton(buttonAction: {})
    }
}
