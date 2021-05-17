//
//  NetworkInfo.swift
//  DameDane
//
//  Created by 박종호 on 2021/05/16.
//

import Foundation

/**
 사용자의 IP 주소와 지정한 Port Number 를 관리하는 클래스
 */
class NetWorkInfo{
    static let netWorkInfo = NetWorkInfo()
    
    private var ipAddress:String = ""
    private var portNumber:String = ""
    
    private init(){
        
    }
    
    public func setIpAddress(ipAddress:String){
        self.ipAddress = ipAddress
    }
    public func getIpAddress() -> String {
        return self.ipAddress
    }
    public func setPortNumber(portNumber:String){
        self.portNumber = portNumber
    }
    public func getPortNumber() -> String{
        return self.portNumber
    }
    /**
     네트워크 정보를 로컬에 저장하는 함수입니다.
     ---
     FunctionInfo
     ==
     - Author: 박종호
     - Date: 2021/05/16
     
     - Parameters:
     - ipAddress: 사용자가 입력한 아이피 주소
     - portNumber: 사용자가 입력한 포트번호
     */
    public func saveIpAddressToLocal(ipAddress:String) {
        self.ipAddress = ipAddress
        let localNetWorkInfo = UserDefaults.standard
        localNetWorkInfo.set(ipAddress,forKey: "IpAddress")
    }
    public func savePortNumberToLocal(portNumber:String){
        self.portNumber = portNumber
        let localNetWorkInfo = UserDefaults.standard
        localNetWorkInfo.set(portNumber,forKey: "PortNumber")
    }
    /**
     로컬로부터 네트워크 정보를 불러오는 함수입니다.
     
     ---
     FunctionInfo
     ==
     - Author: 박종호
     - Date: 2021/05/16
     */
    public func loadNetWorkInformationFromLocal(){
        let localNetWorkInfo = UserDefaults.standard
        if let ipAddress = localNetWorkInfo.string(forKey: "IpAddress")
        {
            self.ipAddress = ipAddress
        }
        if let portNumber = localNetWorkInfo.string(forKey: "PortNumber"){
            self.portNumber=portNumber
        }
    }
    /**
     네트워크 정보가 유효한지 검사하는 함수입니다.
     ---
     FunctionInfo
     ==
     - Author: 박종호
     - Date: 2021/05/16
     ---
     - returns: 검사 결과
     */
    public func isAvailable() -> Bool {
        if ipAddress != "",portNumber != ""{
            return true
        }
        return false
        
    }
}
