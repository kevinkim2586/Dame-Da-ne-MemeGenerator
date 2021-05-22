//
//  NavigationExtension.swift
//  DameDane
//
//  Created by 박종호 on 2021/05/22.
//

import Foundation
import SwiftUI

/**
 커스텀 Navigation Back Button 적용 시 스와이프 제스쳐 비활성화를 해제하기 위한 Protocol Extension
 */
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
