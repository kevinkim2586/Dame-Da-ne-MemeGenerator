//
//  CircularProgressView.swift
//  DameDane
//
//  Created by 박종호 on 2021/05/22.
//

import Foundation
import SwiftUI

struct CustomProgressViewStyle:ProgressViewStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            Text("\(String(format: "%.f",(configuration.fractionCompleted ?? 0)*100)) 퍼센트 완료!").AutoSizeBinggraeFont(weight: .bold, textColor: Color("lightBlue"), fontForWhat: .Caption)
            Circle()
                .stroke(lineWidth: 15.0)
                .opacity(0.3)
                .foregroundColor(Color.accentColor.opacity(0.5))
            
            Circle()
                .trim(from: 0.0, to: CGFloat(configuration.fractionCompleted ?? 0))
                .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round)).foregroundColor(Color.accentColor)
        }
    }
    
}

struct CustomProgressViewProvider : PreviewProvider {
    static var previews: some View {
       testView()
    }
}

struct testView:View{
    @State private var progress:Double = 40.5
    var body: some View{
        ProgressView("test", value: progress, total: Double(100)).progressViewStyle(CustomProgressViewStyle())
    }
}
