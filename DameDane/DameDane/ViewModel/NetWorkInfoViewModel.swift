//
//  NetWorkInfoViewModel.swift
//  DameDane
//
//  Created by 박종호 on 2021/05/16.
//

import Foundation
import Combine

class NetWorkInfoViewModel : ObservableObject{
    /**
     수동으로 뷰를 업데이트 시켜주는 ObjectPublisher 선언
     객체 안의 요소는 바뀌지만, 객체 자체는 동일하기 때문에 뷰 업데이트가 안됨
     */
    let objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
    var netWorkInformation:NetWorkInfo = NetWorkInfo.netWorkInfo
        
    /**
     IpAddress 를 로컬에 저장하는 함수
     
     - Parameters:
     - ipAddress: 아이피주소
     */
    public func saveIpToLocal(_ ipAddress:String){
        netWorkInformation.saveIpAddressToLocal(ipAddress: ipAddress)
    }
    /**
     PortNumber를 로컬에 저장하는 함수
     
     - Parameters:
     - portNumber: 포트번호
     */
    public func savePortToLocal(_ portNumber:String){
        netWorkInformation.savePortNumberToLocal(portNumber: portNumber)
    }
    /*
     view 를 업데이트 해주는 함수
     */
    public func updateView(){
        objectWillChange.send()
    }
    public func getIpAddress() -> String {
        print(netWorkInformation.getIpAddress())
        return netWorkInformation.getIpAddress()
    }
    
    public func getPortNumber() -> String{
        print(netWorkInformation.getPortNumber())
        return netWorkInformation.getPortNumber()
    }
    
    
}
