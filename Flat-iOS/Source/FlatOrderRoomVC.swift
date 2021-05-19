//
//  FlatOrderRoomVC.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/13.
//

import UIKit

class FlatOrderRoomVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Home_order", comment: "")
        self.view.backgroundColor = .white

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        }
    }
    
}
