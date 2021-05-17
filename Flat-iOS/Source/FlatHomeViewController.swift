//
//  FlatHomeViewController.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/12.
//

import UIKit
import SnapKit

final class FlatHomeViewController: UIViewController {
    var tableView:UITableView = UITableView.init()
    let STATUSBAR_HEIGHT = UIApplication.shared.statusBarFrame.height

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Flat_home", comment: "")
        self.loadContents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func loadContents() {
        let titleLabel = UILabel.init(frame: CGRect.init(x: 16, y: 16 + STATUSBAR_HEIGHT, width: 50, height: 24))
        titleLabel.font = .systemFont(ofSize: 20)
        titleLabel.textColor = .flatTextColor()
        titleLabel.backgroundColor = .white
        titleLabel.text = NSLocalizedString("Flat_home", comment: "")
        self.view.addSubview(titleLabel)
        
//        let image:UIImage = UIImage.init(named: "")
//        let myImageView:UIImageView = UIImageView.init(image: image)
//        myImageView.frame = CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: image.size)
//        self.view.addSubview(myImageView)
        
        let joinRoomBtn = UIButton.init(type: .custom)
        joinRoomBtn.setImage(UIImage.init(named: "Btn_join"), for: .normal)
        joinRoomBtn.setTitle(NSLocalizedString("Home_order", comment: ""), for: .normal)
        joinRoomBtn.addTarget(self, action: #selector(joinRoomAction), for: .touchUpInside)
        self.view.addSubview(joinRoomBtn)
        joinRoomBtn.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().offset(41)
            maker.top.equalToSuperview().offset(72 + STATUSBAR_HEIGHT)
            maker.width.height.equalTo(44)
        }
        
        
        let createRoomBtn = UIButton.init(type: .custom)
        createRoomBtn.setImage(UIImage.init(named: "Btn_create"), for: .normal)
        createRoomBtn.setTitle(NSLocalizedString("Home_create", comment: ""), for: .normal)
        createRoomBtn.addTarget(self, action: #selector(createRoomAction), for: .touchUpInside)
        self.view.addSubview(createRoomBtn)
        createRoomBtn.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().offset(72 + STATUSBAR_HEIGHT)
            maker.width.height.equalTo(44)
        }
        
        
        let orderRoomBtn = UIButton.init(type: .custom)
        orderRoomBtn.setImage(UIImage.init(named: "Btn_order"), for: .normal)
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

