//
//  FlatTabbarController.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/12.
//

import UIKit
import SnapKit

final class FlatTabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadViewControllers()
        self.setTabbar()
    }
    
    func loadViewControllers() {
        let homeVC = FlatHomeViewController()
        let cloudVC = FlatCloudViewController()
        let homeNC = UINavigationController(rootViewController: homeVC)
        let cloudNC = UINavigationController(rootViewController: cloudVC)
        homeNC.tabBarItem = UITabBarItem(title: NSLocalizedString("Flat_home", comment: ""), image: UIImage.init(named: "tabbar_home_white"), selectedImage:  UIImage(named: "tabbar_home_gray"))
        cloudNC.tabBarItem = UITabBarItem(title: NSLocalizedString("Flat_cloud", comment: ""), image: UIImage.init(named: "tabbar_cloud_white"), selectedImage:  UIImage.init(named: "tabbar_cloud_gray"))
        self.viewControllers = [homeNC,cloudNC]
    }

    func setTabbar(){
//        self.tabBar.tintColor = .white
//        let view = UIView.init(frame: CGRect.zero)
////        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main., height: self.tabBar.bounds.size.height+50))
//        view.backgroundColor = .hexColor(hex: "#1A1E21")
//        self.tabBar.insertSubview(view, at: 0)
//        view.snp.makeConstraints { (maker) in
//            maker.left.top.right.bottom.equalTo(self.tabBar)
//        }
        self.tabBar.barTintColor = .hexColor(hex: "#1A1E21")
    }
}
