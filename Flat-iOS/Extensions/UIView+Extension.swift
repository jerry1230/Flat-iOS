//
//  UIView+Extension.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/13.
//

import Foundation
import UIKit

public extension UIView {
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set{
            self.frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set{
            self.frame.origin.y = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set{
            self.frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set{
            self.frame.size.height = newValue
        }
    }
    
    var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set{
            self.frame.origin = newValue
        }
    }
    
    var size: CGSize {
        get {
            return self.frame.size
        }
        set{
            self.frame.size = newValue
        }
    }
    
}
