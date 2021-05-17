//
//  FlatLoginVC.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/14.
//

import Foundation
import UIKit
import Alamofire
import SnapKit

class FlatLoginVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadContentUI()
    }
    
    func loadContentUI() {
        let image:UIImage = UIImage.init(named: "Login_logo")!
        let imageView:UIImageView = UIImageView.init(image: image)
        imageView.frame = CGRect.init(origin: CGPoint.zero, size: image.size)
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (maker) in
            maker.size.equalTo(image.size)
            maker.centerX.equalTo(self.view)
            maker.top.equalTo(view).offset(234)
        }
        
        let flatLabel = UILabel.init()
        flatLabel.font = UIFont.systemFont(ofSize: 24)
        flatLabel.textColor = UIColor.hexColor(hex: "#444E60")
        flatLabel.text = NSLocalizedString("Flat", comment: "")
        self.view.addSubview(flatLabel)
        flatLabel.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize.init(width: 43, height: 36))
            maker.centerX.equalTo(view)
            maker.top.equalTo(imageView.snp_top).offset(112)
        }
        
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 180, height: 24))
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.hexColor(hex: "#7A7B7C")
        label.text = NSLocalizedString("Login_slogan", comment: "")
        self.view.addSubview(label)
        label.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize.init(width: 180, height: 24))
            maker.centerX.equalTo(view)
            maker.top.equalTo(imageView.snp_bottom).offset(20)
        }
        
        let wechatBtn:UIButton = UIButton.init(type: .custom)
        let wechatImage:UIImage = UIImage.init(named: "logo_wechat")!
        wechatBtn.setImage(wechatImage, for: .normal)
        wechatBtn.frame = CGRect.init(x: 0, y: 0, width: 64, height: 64)
        wechatBtn.addTarget(self, action: #selector(wechatLoginAction), for: .touchUpInside)
        self.view.addSubview(wechatBtn)
        wechatBtn.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize.init(width: 64, height: 64))
            maker.centerX.equalTo(view).offset(-51.5)
            maker.top.equalTo(imageView.snp_bottom).offset(220)
        }
        
        let githubBtn:UIButton = UIButton.init(type: .custom)
        let githubImage:UIImage = UIImage.init(named: "logo_github")!
        githubBtn.setImage(githubImage, for: .normal)
        githubBtn.frame = CGRect.init(x: 0, y: 0, width: 64, height: 64)
        githubBtn.addTarget(self, action: #selector(wechatLoginAction), for: .touchUpInside)
        self.view.addSubview(githubBtn)
        githubBtn.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize.init(width: 64, height: 64))
            maker.centerX.equalTo(view).offset(51.5)
            maker.top.equalTo(imageView.snp_bottom).offset(220)
        }
        
        let bottomLabel = UILabel.init()
        bottomLabel.font = UIFont.systemFont(ofSize: 16)
        bottomLabel.textColor = UIColor.hexColor(hex: "#7A7B7C")
        bottomLabel.text = NSLocalizedString("Flat_statement", comment: "")
        self.view.addSubview(bottomLabel)
        bottomLabel.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize.init(width: 136, height: 24))
            maker.centerX.equalTo(view)
            maker.bottom.equalTo(view.snp_bottom).offset(-32)
        }
    }
    
    @objc func wechatLoginAction() {
        
        
        
    }
    
    func loginRequest() {
        
    }
}
