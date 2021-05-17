//
//  FlatLoginVC.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/14.
//

import UIKit
import Alamofire
import SnapKit

class FlatLoginVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadContentUI()
    }
    
    func loadContentUI() {
        let image = UIImage(named: "Login_logo")!
        let imageView = UIImageView(image: image)
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (maker) in
            maker.size.equalTo(image.size)
            maker.centerX.equalTo(self.view)
            maker.top.equalTo(view).offset(234)
        }
        
        let flatLabel = UILabel()
        flatLabel.font = .systemFont(ofSize: 24)
        flatLabel.textAlignment = .center
        flatLabel.textColor = .hexColor(hex: "#444E60")
        flatLabel.text = NSLocalizedString("Flat", comment: "")
        self.view.addSubview(flatLabel)
        flatLabel.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize(width: 43, height: 36))
            maker.centerX.equalTo(view)
            maker.top.equalTo(imageView.snp_top).offset(112)
        }
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .hexColor(hex: "#7A7B7C")
        label.text = NSLocalizedString("Login_slogan", comment: "")
        self.view.addSubview(label)
        label.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize(width: 180, height: 24))
            maker.centerX.equalTo(view)
            maker.top.equalTo(imageView.snp_bottom).offset(20)
        }
        
        let wechatBtn = UIButton(type: .custom)
        let wechatImage = UIImage(named: "logo_wechat")!
        wechatBtn.setImage(wechatImage, for: .normal)
        wechatBtn.addTarget(self, action: #selector(wechatLoginAction), for: .touchUpInside)
        self.view.addSubview(wechatBtn)
        wechatBtn.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize(width: 64, height: 64))
            maker.centerX.equalTo(view).offset(-51.5)
            maker.top.equalTo(imageView.snp_bottom).offset(220)
        }
        
        let githubBtn = UIButton(type: .custom)
        let githubImage = UIImage(named: "logo_github")!
        githubBtn.setImage(githubImage, for: .normal)
        githubBtn.addTarget(self, action: #selector(githubLoginAction), for: .touchUpInside)
        self.view.addSubview(githubBtn)
        githubBtn.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize(width: 64, height: 64))
            maker.centerX.equalTo(view).offset(51.5)
            maker.top.equalTo(imageView.snp_bottom).offset(220)
        }
        
        let bottomLabel = UILabel()
        bottomLabel.font = .systemFont(ofSize: 16)
        bottomLabel.textAlignment = .center
        bottomLabel.textColor = .hexColor(hex: "#7A7B7C")
        bottomLabel.text = NSLocalizedString("Flat_statement", comment: "")
        self.view.addSubview(bottomLabel)
        bottomLabel.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize(width: 136, height: 24))
            maker.centerX.equalTo(view)
            maker.bottom.equalTo(view.snp_bottom).offset(-32)
        }
        
    }
    
    @objc func wechatLoginAction() {
        self.tempJump()
    }
    
    @objc func githubLoginAction() {
        
    }
    
    func loginRequest() {
        
    }
    
    func tempJump() {
        
    }
}
