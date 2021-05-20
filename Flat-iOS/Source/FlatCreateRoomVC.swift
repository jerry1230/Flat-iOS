//
//  FlatCreateRoomVC.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/13.
//

import UIKit

class FlatCreateRoomVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Home_create", comment: "")
        self.view.backgroundColor = .white
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)

        let themeLB = UILabel(frame: CGRect())
        themeLB.font = .systemFont(ofSize: 14)
        themeLB.textColor = .hexColor(hex: "#7A7B7C")
        themeLB.text = NSLocalizedString("Create_theme", comment: "")
        self.view.addSubview(themeLB)
        themeLB.snp.makeConstraints { maker in
            maker.left.top.equalTo(16)
            maker.size.equalTo(CGSize(width: 30, height: 21))
        }
        
        let themeTF = UITextField()
        themeTF.font = .systemFont(ofSize: 16)
        themeTF.textColor = .hexColor(hex: "#444E60")
        themeTF.tintColor = .hexColor(hex: "#444E60")
        themeTF.placeholder = NSLocalizedString("Create_tftheme", comment: "")
        themeTF.borderStyle = .roundedRect
        self.view.addSubview(themeTF)
        themeTF.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().offset(16)
            maker.right.equalToSuperview().offset(-16)
            maker.top.equalTo(46)
            maker.height.equalTo(48)
        }

        let roomTypeLB = UILabel()
        roomTypeLB.font = .systemFont(ofSize: 14)
        roomTypeLB.textColor = .hexColor(hex: "#7A7B7C")
        roomTypeLB.text = NSLocalizedString("Create_type", comment: "")
        self.view.addSubview(roomTypeLB)
        roomTypeLB.snp.makeConstraints { maker in
            maker.left.equalTo(16)
            maker.top.equalTo(110)
            maker.size.equalTo(CGSize(width: 30, height: 21))
        }
    
        let imgArray:[String] = ["onetoone", "bigclass", "smallclass"]
        let nameArray:[String] = ["Create_oneclass", "Create_bigclass", "Create_smallclass"]
        for index in 0...2 {
            let classBtn = UIButton(type: .custom)
            classBtn.isSelected = index == 0 ? true : false
            classBtn.setTitle(NSLocalizedString(nameArray[index], comment: ""), for: .normal)
            classBtn.titleLabel?.font = .systemFont(ofSize: 16)
            classBtn.setImage(UIImage(named: imgArray[index]), for: .normal)
            classBtn.contentVerticalAlignment = .top
            classBtn.contentHorizontalAlignment = .left
            classBtn.imageEdgeInsets = UIEdgeInsets.init(top: 8, left: 8, bottom: 44, right: 8)
            classBtn.titleEdgeInsets = UIEdgeInsets.init(top: 106, left: 31, bottom: 12, right: 31)
            classBtn.addTarget(self, action: #selector(classSelectedAction), for: .touchUpInside)
            classBtn.clipsToBounds = true
            //FIXME:Corner display wrong
            //classBtn.makeCornerRadius()
            classBtn.layer.cornerRadius = 4
            classBtn.layer.borderWidth = 1
            classBtn.layer.borderColor = UIColor.hexColor(hex: index == 0 ? "#3381FF" : "#DBE1EA").cgColor

            self.view.addSubview(classBtn)
            classBtn.snp.makeConstraints { (maker) in
                maker.left.equalToSuperview().offset(120 * index + 16 )
                maker.top.equalToSuperview().offset(140)
                maker.size.equalTo(CGSize(width: 104, height: 140))
            }
            
            let classStateBtn = UIButton(type: .custom)
            classStateBtn.isSelected = index == 0 ? true : false
            classStateBtn.setImage(UIImage(named: "Btn_create"), for: .normal)
            classStateBtn.setImage(UIImage(named: "Btn_join"), for: .selected)
            self.view.addSubview(classStateBtn)
            classStateBtn.snp.makeConstraints { (maker) in
                maker.left.equalToSuperview().offset(120 * index + 60)
                maker.top.equalTo(classBtn.snp.bottom).offset(16)
                maker.size.equalTo(CGSize(width: 16, height: 16))
            }
        }

        let joinSettingLB = UILabel()
        joinSettingLB.font = .systemFont(ofSize: 14)
        joinSettingLB.textColor = .hexColor(hex: "#7A7B7C")
        joinSettingLB.text = NSLocalizedString("Join_join", comment: "")
        self.view.addSubview(joinSettingLB)
        joinSettingLB.snp.makeConstraints { maker in
            maker.left.equalTo(16)
            maker.top.equalTo(328)
            maker.size.equalTo(CGSize(width: 72, height: 24))
        }
        
        let videoSelectBtn = UIButton(type: .custom)
        videoSelectBtn.setImage(UIImage(named: "Btn_create"), for: .normal)
        videoSelectBtn.setImage(UIImage(named: "Btn_join"), for: .selected)
        videoSelectBtn.addTarget(self, action: #selector(videoSelectAction), for: .touchUpInside)
        self.view.addSubview(videoSelectBtn)
        videoSelectBtn.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().offset(8)
            maker.top.equalTo(joinSettingLB.snp.bottom).offset(8)
            maker.size.equalTo(CGSize(width: 32, height: 32))
        }
        
        let cameraLB = UILabel()
        cameraLB.font = .systemFont(ofSize: 14)
        cameraLB.textColor = .hexColor(hex: "#7A7B7C")
        cameraLB.text = NSLocalizedString("Join_camera", comment: "")
        self.view.addSubview(cameraLB)
        cameraLB.snp.makeConstraints { maker in
            maker.left.equalTo(40)
            maker.top.equalTo(joinSettingLB.snp.bottom).offset(12)
            maker.size.equalTo(CGSize(width: 72, height: 24))
        }
        
        let joinRoomBtn = UIButton(type: .custom)
        joinRoomBtn.setTitle(NSLocalizedString("Create_create", comment: ""), for: .normal)
        joinRoomBtn.backgroundColor = .hexColor(hex: "#3381FF")
        joinRoomBtn.titleLabel?.font = .systemFont(ofSize: 16)
        joinRoomBtn.addTarget(self, action: #selector(createRoomAction), for: .touchUpInside)
        joinRoomBtn.makeCornerRadius()
        self.view.addSubview(joinRoomBtn)
        joinRoomBtn.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().offset(16)
            maker.right.equalToSuperview().offset(-16)
            maker.bottom.equalToSuperview().offset(-32)
            maker.height.equalTo(40)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        }
    }
    
    @objc func classSelectedAction(_ button:UIButton) {
        button.isSelected = true
        
        button.layer.borderColor = UIColor.hexColor(hex: "#3381FF").cgColor
    }
    
    @objc func videoSelectAction(_ button: UIButton) {
        button.isSelected = !button.isSelected
    }
    
    @objc func createRoomAction() {
        
    }
    
}

