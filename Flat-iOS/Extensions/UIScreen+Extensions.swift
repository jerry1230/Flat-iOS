//
//  UIScreen+Extensions.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/13.
//

import Foundation
import UIKit

public extension UIScreen {
    
    class var f_size: CGSize {
        return UIScreen.main.bounds.size
    }
    
    class var f_width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    class var f_height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
}
