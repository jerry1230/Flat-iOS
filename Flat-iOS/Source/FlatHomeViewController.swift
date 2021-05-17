//
//  FlatHomeViewController.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/12.
//

import UIKit
import SnapKit

final class FlatHomeViewController: UIViewController {
    let STATUSBAR_HEIGHT = UIApplication.shared.statusBarFrame.height
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)        
        
//        if #available(iOS 11.0, *) {
//            self.navigationItem.largeTitleDisplayMode = .always
//            self.navigationController?.navigationBar.prefersLargeTitles = true
//            self.navigationController?.navigationBar.largeTitleTextAttributes = [.font : UIFont.systemFont(ofSize: 20) , .foregroundColor : UIColor.flatTextColor()]
//        } else {
//            // Fallback on earlier versions
//        }
        
        let titleLabel = UILabel(frame: CGRect(x: 16, y: 16 + STATUSBAR_HEIGHT, width: 50, height: 24))
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = .flatTextColor()
        titleLabel.backgroundColor = .white
        titleLabel.text = NSLocalizedString("Flat_home", comment: "")
        self.view.addSubview(titleLabel)

        self.loadContents()
    }
    

    
    func loadContents() {
//        let image = UIImage(named: "")
//        let myImageView = UIImageView(image: image)
//        myImageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: image.size)
//        self.view.addSubview(myImageView)
        
        let joinRoomBtn = UIButton(type: .custom)
        joinRoomBtn.setImage(UIImage(named: "Btn_join"), for: .normal)
        joinRoomBtn.setTitle(NSLocalizedString("Home_order", comment: ""), for: .normal)
        joinRoomBtn.addTarget(self, action: #selector(joinRoomAction), for: .touchUpInside)
        self.view.addSubview(joinRoomBtn)
        joinRoomBtn.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().offset(41)
            maker.top.equalToSuperview().offset(72 + STATUSBAR_HEIGHT)
            maker.width.height.equalTo(44)
        }
        
        
        let createRoomBtn = UIButton(type: .custom)
        createRoomBtn.setImage(UIImage(named: "Btn_create"), for: .normal)
        createRoomBtn.setTitle(NSLocalizedString("Home_create", comment: ""), for: .normal)
        createRoomBtn.addTarget(self, action: #selector(createRoomAction), for: .touchUpInside)
        self.view.addSubview(createRoomBtn)
        createRoomBtn.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().offset(72 + STATUSBAR_HEIGHT)
            maker.width.height.equalTo(44)
        }
        
        
        let orderRoomBtn = UIButton(type: .custom)
        orderRoomBtn.setImage(UIImage(named: "Btn_order"), for: .normal)
        orderRoomBtn.setTitle(NSLocalizedString("Home_order", comment: ""), for: .normal)
        orderRoomBtn.addTarget(self, action: #selector(orderRoomAction), for: .touchUpInside)
        self.view.addSubview(orderRoomBtn)
        orderRoomBtn.snp.makeConstraints { (maker) in
            maker.right.equalToSuperview().offset(-41)
            maker.top.equalToSuperview().offset(72 + STATUSBAR_HEIGHT)
            maker.width.height.equalTo(44)
        }
    }
    
    
    @objc func joinRoomAction() {
        let vc = FlatJoinRoomVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func createRoomAction() {
        let vc = FlatCreateRoomVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func orderRoomAction() {
        let vc = FlatOrderRoomVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

