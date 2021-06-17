//
//  ImageManager.swift
//  DameDane
//
//  Created by 박종호 on 2021/06/06.
//

import Foundation
import SwiftUI
struct ImageManager {
     private var _image:UIImage?
     private var _resultImage:UIImage?
    
     var image:UIImage? {
        get {
            return _image
        }
        set(value) {
            _image = value
        }
    }
    
    var resultImage:UIImage? {
        get{
            return _resultImage
        }
        set(value){
            _resultImage = value
        }
    }
    
    func checkImageSize() -> Bool{
        if _image?.size.width == 256 && _image?.size.height == 256 {
            return true
        }
        else {
            return false
        }
    }

}
