//
//  CompleteConvertScreen.swift
//  DameDane
//
//  Created by 박종호 on 2021/05/22.
//

import SwiftUI

struct CompleteConvertScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var imageManagerViewModel:ImageManagerViewModel
    @State var showSaveAlert = false

    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Text("완성되었습니다!").AutoSizeBinggraeFont(weight: .bold, textColor: .black, fontForWhat: .Title).padding(.init(top: 0, leading: 16, bottom: 16, trailing: 16))
                
                if let resultImage = imageManagerViewModel.getResultImage(){
                    Image(uiImage: resultImage)
                }
                
                Button(action:{
                    showSaveAlert.toggle()
                }){
                    RoundButton(textToShow: Text("기기에 저장하기")).frame(width: geometry.size.width*0.7, height: geometry.size.height*0.07, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding()
                        .alert(isPresented: $showSaveAlert, content: {
                            Alert(title: Text("변경 사항을 \n저장하시겠습니까?"), primaryButton: .destructive(Text("확인"), action: {
                                if let uiImage = imageManagerViewModel.getResultImage(){
                                UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
                                }

                            }), secondaryButton: .cancel(Text("취소")))
                        })
                }
                Spacer()
                HStack{
                    FloatingActionButton(buttonAction: {
                        presentationMode.wrappedValue.dismiss()
                    }).padding()
                    Spacer()
                }.padding()
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }.navigationBarItems(leading: CustomBackButton(buttonAction: {
            presentationMode.wrappedValue.dismiss()
        }))
    }
}

struct CompleteConvertScreen_Previews: PreviewProvider {
    static var previews: some View {
        CompleteConvertScreen(imageManagerViewModel: ImageManagerViewModel())
    }
}
