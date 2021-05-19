//
//  FlatJoinRoomVC.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/13.
//

import UIKit

class FlatJoinRoomVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = NSLocalizedString("Home_join", comment: "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        }
    }
    
}
