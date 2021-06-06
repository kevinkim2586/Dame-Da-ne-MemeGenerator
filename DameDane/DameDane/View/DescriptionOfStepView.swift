//
//  DescriptionOfStepView.swift
//  DameDane
//
//  Created by 박종호 on 2021/05/22.
//

import SwiftUI

struct DescriptionOfStepView: View {
    @Binding var isProgressConvert:Bool //버튼 클릭 시 변환 작업 뷰로 이동하기 위한 상태 프로퍼티
    @Binding var isComplete:Bool //변환 완료 뷰 관련 상태 프로퍼티
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showingImagePicker = false
    @State var pickedImage:Image?
    @State var isSizeFit:Bool = false
    
    
    var body: some View {
        VStack{
            HStack{
                Text("단계").AutoSizeBinggraeFont(weight: .bold, textColor: .black, fontForWhat: .Title).padding(.init(top: 0, leading: 16, bottom: 8, trailing: 16))
                Spacer()
            }
            HStack{
                Image(systemName: "1.circle").padding()
                Text("먼저, 이미지 크롭 사이트로 가셔서 합성할 사진을 256 * 256 사이즈로 기기에 저장해주세요").lineSpacing(5).AutoSizeBinggraeFont(weight: .medium, textColor: .black, fontForWhat: .Body).multilineTextAlignment(.leading)
                Spacer()
                
            }.padding(.init(top: 16, leading: 0, bottom: 0, trailing: 0))
            Link(destination: URL(string:"https://www.kapwing.com/studio")!){
                HStack{
                    Image(systemName: "paperplane").imageScale(.medium).foregroundColor(Color("lightBlue")).padding()
                    Text("바로가기").AutoSizeBinggraeFont(weight: .medium, textColor: Color("lightBlue"), fontForWhat: .Body)
                    Spacer()
                }
            }.padding(.top,10)
            HStack{
                Image(systemName: "2.circle").padding()
                Text("256 * 256 해상도의 사진을 아래 버튼을 눌러 골라주세요.").AutoSizeBinggraeFont(weight: .medium, textColor: .black, fontForWhat: .Body)
                Spacer()
            }.padding(.top,10)
            Button(action:{
                self.showingImagePicker.toggle()
            }){
                ZStack{
                    RoundedRectangle(cornerRadius: 0).strokeBorder(Color.gray,lineWidth: 1)
                        .frame(width: 170, height: 170, alignment: .center)
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                        .foregroundColor(Color("lightBlue"))
                    if let pickedImage = pickedImage {
                            pickedImage.resizable().scaledToFit().frame(height:170,alignment: .center).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    }
                }.padding().padding(.top,20)
            }.sheet(isPresented: $showingImagePicker) {
                SUImagePicker(sourceType: .photoLibrary) { (image) in
                    self.pickedImage = Image(uiImage: image)
                    if image.size.width == 256 && image.size.height == 256 {
                        isSizeFit = true
                    }
                    else {
                        isSizeFit = false
                    }
                }
            }
            Text("반드시 256 * 256 사이즈의 사진을 골라주세요!").AutoSizeBinggraeFont(weight: .medium, textColor: .black, fontForWhat: .Caption)
            if pickedImage != nil && !isSizeFit {
                Text("사진을 다시 골라주세요!").AutoSizeBinggraeFont(weight: .regular, textColor: .red, fontForWhat: .Caption)
            }
            Spacer()
            
            /**
             알맞은 해상도의 사진을 선택했을 시 변환 버튼을 활성화 시킨다
             사진을 담당하는 모델 구현 필요 및, 해상도 확인 함수 구현 필요
             */
            if pickedImage != nil && isSizeFit {
                GeometryReader{ geometry in
                    ZStack{
                        Button(action:{
                            withAnimation{
                                isProgressConvert.toggle()
                            }
                        }){
                            RoundButton(textToShow: Text("변환하기"))
                                .frame(width:geometry.size.width*0.7,height:geometry.size.height*0.35)
                        }.frame(width: geometry.size.width, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    }
                }
            }
        }.navigationBarItems(leading: CustomBackButton(buttonAction: {
            presentationMode.wrappedValue.dismiss()
        }))
    }
}


struct DescriptionOfStepView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionOfStepView(isProgressConvert: .constant(false),isComplete: .constant(false))
    }
}
