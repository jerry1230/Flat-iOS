//
//  FlatJoinRoomVC.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/13.
//

import Foundation
import UIKit
class FlatJoinRoomVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Home_join", comment: "")
        navigationController?.setNavigationBarHidden(false, animated: false)
        self.view.backgroundColor = UIColor.yellow
    }
}
