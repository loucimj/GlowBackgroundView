//
//  UIView+GlowBackground.swift
//  GlowBackgroundView
//
//  Created by Javier Loucim on 9/8/17.
//  Copyright © 2017 Qeeptouch. All rights reserved.
//

import Foundation
import UIKit

private var UIViewGlowColorKey: UInt8 = 12

extension UIView {
    
    var glowBackground: UIColor? {
        get {
            return objc_getAssociatedObject(self, &UIViewGlowColorKey) as? UIColor
        }
        
        set {
            objc_setAssociatedObject(self, &UIViewGlowColorKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            if let color = glowBackground {
                addGlowView(color: color)
            }
            
        }
    }
    
    fileprivate func addGlowView(color:UIColor) {
        
        self.backgroundColor = color
        let variance:CGFloat = 0.3
        let gradient = CAGradientLayer()
        
        var rgba = [CGFloat](repeating: 0.0, count: 4)
        color.getRed(&rgba[0], green: &rgba[1], blue: &rgba[2], alpha: &rgba[3])
        
        let startColor =  UIColor(red: max(rgba[0] + variance, 0.0), green: max(rgba[1] + variance, 0.0), blue: max(rgba[2] + variance, 0.0), alpha: rgba[3])
        
        let targetColor = UIColor(red: max(rgba[0] + variance, 0.0), green: max(rgba[1] + variance, 0.0), blue: max(rgba[2] + variance, 0.0), alpha:0.0)

        gradient.frame = self.bounds
        gradient.colors = [startColor.cgColor, targetColor.cgColor]
        
        self.layer.insertSublayer(gradient, at: 0)       
       
    }
}
