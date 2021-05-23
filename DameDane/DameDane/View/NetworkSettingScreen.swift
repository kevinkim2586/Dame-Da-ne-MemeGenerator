//
//  NetworkSettingScreen.swift
//  DameDane
//
//  Created by 박종호 on 2021/05/16.
//

import SwiftUI

struct NetworkSettingScreen: View {
    @ObservedObject var netWorkInfoViewModel = NetWorkInfoViewModel()
    @State var ipAddress = ""
    @State var portNumber = ""
    @State var showSaveAlert = false
    @State var saveCompleteAlert = false // 
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        GeometryReader{ geometry in
            VStack{
                
                HStack{
                    Text("현재 IP 주소: "+netWorkInfoViewModel.getIpAddress()).AutoSizeBinggraeFont(weight: .bold, textColor: .black, fontForWhat: .Body).padding()
                    Spacer()
                }
                TextField("변경할 ip 주소를 입력해주세요", text: $ipAddress).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                
                HStack{
                    Text("현재 PORT 번호: " + netWorkInfoViewModel.getPortNumber()).AutoSizeBinggraeFont(weight: .bold, textColor: .black, fontForWhat: .Body)
                    Spacer()
                }.padding()
                TextField("변경할 0 ~ 9999 사이의 포트 번호를 입력해주세요",text:$portNumber).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                Spacer()
                
                Button(action:{
                    showSaveAlert = true
                  
                }){
                    RoundButton(textToShow: Text("저장하기"))
                        .frame(width: geometry.size.width*0.7, height: geometry.size.height*0.07, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .alert(isPresented: $showSaveAlert, content: {
                            Alert(title: Text("변경 사항을 \n저장하시겠습니까?"), primaryButton: .destructive(Text("확인"), action: {
                                if ipAddress != ""{
                                    netWorkInfoViewModel.saveIpToLocal(ipAddress)
                                }
                                if portNumber != "" {
                                    netWorkInfoViewModel.savePortToLocal(portNumber)
                                }
                                netWorkInfoViewModel.updateView()
                            }), secondaryButton: .cancel(Text("취소")))
                        })
                }
                
                Spacer().frame(height:geometry.size.height*0.15)
            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
        }.navigationBarBackButtonHidden(true).navigationBarItems(leading: CustomBackButton(buttonAction: {
            presentationMode.wrappedValue.dismiss()
        }))
        
    }
}

struct NetworkSettingScreen_Previews: PreviewProvider {
    static var previews: some View {
        NetworkSettingScreen()
    }
}
