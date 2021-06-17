//
//  ImageManagerViewModel.swift
//  DameDane
//
//  Created by 박종호 on 2021/06/06.
//

import Foundation
import SwiftUI

//선택한 이미지의 경우, 오류 등으로 이전 화면으로 돌아가거나 진행 중인 화면에도 표시를 해야 하기 때문에, 모든 뷰에서 접근가능하게 관리
class ImageManagerViewModel:ObservableObject {
    @Published var imageManager = ImageManager()
    
    
    func checkImageSize() -> Bool {
        return imageManager.checkImageSize()
    }
    func setCurrentImage(image:UIImage) {
        imageManager.image = image
    }
    func getCurrentImage() -> UIImage?{
        return imageManager.image
    }
    
    func setResultImage(image:UIImage){
        imageManager.resultImage = image
    }
    
    func getResultImage()->UIImage?{
        return imageManager.resultImage
    }
}
