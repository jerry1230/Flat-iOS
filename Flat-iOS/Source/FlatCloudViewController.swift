//
//  FlatCloudViewController.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/12.
//

import Foundation
import UIKit
import SnapKit

final class FlatCloudViewController:UIViewController{
    
    let joinRoomBtn:UIButton = UIButton.init(type: .custom)
    let createRoomBtn:UIButton = UIButton.init(type: .custom)
    let orderRoomBtn:UIButton = UIButton.init(type: .custom)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Flat_cloud", comment: "")
        navigationController?.setNavigationBarHidden(true, animated: false)

    }
    
   
    
   
}
