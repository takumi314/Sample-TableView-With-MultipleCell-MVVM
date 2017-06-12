//
//  UIViewExtension.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/13.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit

extension UIView {

    func rotate(_ toValue: CGFloat, duration: TimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")

        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards

        self.layer.add(animation, forKey: nil)
    }

}
