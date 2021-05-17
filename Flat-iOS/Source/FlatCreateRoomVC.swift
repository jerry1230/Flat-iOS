//
//  FlatCreateRoomVC.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/13.
//

import UIKit

class FlatCreateRoomVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Home_create", comment: "")
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.view.backgroundColor = .white

    }
}
