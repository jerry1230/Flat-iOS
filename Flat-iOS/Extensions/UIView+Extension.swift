//
//  UIView+Extension.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/13.
//

import UIKit

public extension UIView {
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.frame.origin = newValue
        }
    }
    
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = newValue
        }
    }
    
    func bottomBorder(width: CGFloat, borderColor: UIColor) {
        let rect = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        drawBorder(rect: rect, color: borderColor)
    }
    
    private func drawBorder(rect:CGRect, color:UIColor) {
        let line = UIBezierPath(rect: rect)
        let lineShape = CAShapeLayer()
        lineShape.path = line.cgPath
        lineShape.fillColor = color.cgColor
        self.layer.addSublayer(lineShape)
    }
    
    func makeCornerRadius(radius: CGFloat = 4.0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            let radiusLayer = CAShapeLayer()
            radiusLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: radius,height: radius)).cgPath
            self.layer.mask = radiusLayer
        }
    }
}
