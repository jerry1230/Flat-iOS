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
        if #available(iOS 11.0, *) {
            self.navigationItem.title = NSLocalizedString("Flat_cloud", comment: "")
            self.navigationItem.largeTitleDisplayMode = .always
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.largeTitleTextAttributes = [.font : UIFont.boldSystemFont(ofSize: 34)]
        } else {
            
            self.title = NSLocalizedString("Flat_cloud", comment: "")
            
//            let titleLabel = UILabel(frame: CGRect(x: 16, y: 16 + STATUSBAR_HEIGHT, width: 70, height: 48))
//            titleLabel.font = .boldSystemFont(ofSize: 20)
//            titleLabel.textColor = .flatTextColor()
//            titleLabel.backgroundColor = .white
//            titleLabel.text = NSLocalizedString("Flat_home", comment: "")
//            self.view.addSubview(titleLabel)
            
            
            
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .always
        }
    }
    
   
}
