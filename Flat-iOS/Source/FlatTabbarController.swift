//
//  FlatTabbarController.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/12.
//

import Foundation
import UIKit
final class FlatTabbarController:UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadViewControllers()
        self.setTabbar()
    }
    
    func loadViewControllers() {
        let homeVC:FlatHomeViewController = FlatHomeViewController.init()
        let cloudVC:FlatCloudViewController = FlatCloudViewController.init()
        let homeNC:UINavigationController = UINavigationController.init(rootViewController: homeVC)
        let cloudNC:UINavigationController = UINavigationController.init(rootViewController: cloudVC)
        homeNC.tabBarItem = UITabBarItem.init(title: NSLocalizedString("Flat_home", comment: ""), image: UIImage.init(named: "tabbar_home_white"), selectedImage:  UIImage.init(named: "tabbar_home_gray"))
        cloudNC.tabBarItem = UITabBarItem.init(title: NSLocalizedString("Flat_cloud", comment: ""), image: UIImage.init(named: "tabbar_cloud_white"), selectedImage:  UIImage.init(named: "tabbar_cloud_gray"))
        self.viewControllers = [homeNC,cloudNC]
    }

    func setTabbar(){
        self.tabBar.tintColor = UIColor.white
        let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.tabBar.bounds.size.width, height: self.tabBar.bounds.size.height+50))
        view.backgroundColor = UIColor.hexColor(hex: "#1A1E21")
        self.tabBar.insertSubview(view, at: 0)
    }
}
