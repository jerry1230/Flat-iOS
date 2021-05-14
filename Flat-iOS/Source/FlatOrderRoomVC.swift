//
//  FlatOrderRoomVC.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/13.
//

import Foundation
import UIKit
class FlatOrderRoomVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Home_order", comment: "")
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
