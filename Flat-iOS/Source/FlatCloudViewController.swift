//
//  FlatCloudViewController.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/12.
//

import UIKit
import SnapKit

final class FlatCloudViewController: UIViewController {
    let STATUSBAR_HEIGHT = UIApplication.shared.statusBarFrame.height
    let joinRoomBtn = UIButton(type: .custom)
    let createRoomBtn = UIButton(type: .custom)
    let orderRoomBtn = UIButton(type: .custom)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let titleLabel = UILabel(frame: CGRect(x: 16, y: 16 + STATUSBAR_HEIGHT, width: 50, height: 24))
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = .flatTextColor()
        titleLabel.backgroundColor = .white
        titleLabel.text = NSLocalizedString("Flat_cloud", comment: "")
        self.view.addSubview(titleLabel)

    }
    
   
    
   
}
