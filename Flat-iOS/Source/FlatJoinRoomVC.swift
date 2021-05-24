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
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        self.view.backgroundColor = .white
        self.navigationItem.title = NSLocalizedString("Home_join", comment: "")
        
        let roomNumberLB = UILabel(frame: CGRect())
        roomNumberLB.font = .systemFont(ofSize: 14)
        roomNumberLB.textColor = .hexColor(hex: "#7A7B7C")
        roomNumberLB.text = NSLocalizedString("Join_id", comment: "")
        self.view.addSubview(roomNumberLB)
        roomNumberLB.snp.makeConstraints { maker in
            maker.left.top.equalTo(16)
            maker.size.equalTo(CGSize(width: 45, height: 21))
        }
        
        let roomNumberTF = UITextField()
        roomNumberTF.font = .systemFont(ofSize: 16)
        roomNumberTF.textColor = .hexColor(hex: "#444E60")
        roomNumberTF.tintColor = .hexColor(hex: "#444E60")
        roomNumberTF.placeholder = NSLocalizedString("Join_tfnumber", comment: "")
        roomNumberTF.borderStyle = .roundedRect
        self.view.addSubview(roomNumberTF)
        roomNumberTF.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(16)
            maker.top.equalTo(46)
            maker.height.equalTo(48)
        }
        
        
        let nickNameLB = UILabel()
        nickNameLB.font = .systemFont(ofSize: 14)
        nickNameLB.textColor = .hexColor(hex: "#7A7B7C")
        nickNameLB.text = NSLocalizedString("Join_nickname", comment: "")
        self.view.addSubview(nickNameLB)
        nickNameLB.snp.makeConstraints { maker in
            maker.left.equalTo(16)
            maker.top.equalTo(110)
            maker.size.equalTo(CGSize(width: 45, height: 21))
        }
        
        let nickNameTF = UITextField()
        nickNameTF.font = .systemFont(ofSize: 16)
        nickNameTF.textColor = .hexColor(hex: "#444E60")
        nickNameTF.tintColor = .hexColor(hex: "#444E60")
        nickNameTF.borderStyle = .roundedRect
        nickNameTF.placeholder = NSLocalizedString("Join_tfname", comment: "")
        self.view.addSubview(nickNameTF)
        nickNameTF.snp.makeConstraints { maker in
            maker.left.equalTo(16)
            maker.right.equalTo(-16)
            maker.top.equalTo(140)
            maker.height.equalTo(48)
        }
        
        let joinLB = UILabel()
        joinLB.font = .systemFont(ofSize: 14)
        joinLB.textColor = .hexColor(hex: "#7A7B7C")
        joinLB.text = NSLocalizedString("Join_join", comment: "")
        self.view.addSubview(joinLB)
        joinLB.snp.makeConstraints { maker in
            maker.left.equalTo(16)
            maker.top.equalTo(204)
            maker.size.equalTo(CGSize(width: 60, height: 22))
        }
        
        let micLB = UILabel()
        micLB.font = .systemFont(ofSize: 14)
        micLB.textColor = .hexColor(hex: "#7A7B7C")
        micLB.text = NSLocalizedString("Join_mic", comment: "")
        self.view.addSubview(micLB)
        micLB.snp.makeConstraints { maker in
            maker.left.equalTo(40)
            maker.top.equalTo(238)
            maker.size.equalTo(CGSize(width: 72, height: 24))
        }
        
        let cameraLB = UILabel()
        cameraLB.font = .systemFont(ofSize: 14)
        cameraLB.textColor = .hexColor(hex: "#7A7B7C")
        cameraLB.text = NSLocalizedString("Join_camera", comment: "")
        self.view.addSubview(cameraLB)
        cameraLB.snp.makeConstraints { maker in
            maker.left.equalTo(166)
            maker.top.equalTo(238)
            maker.size.equalTo(CGSize(width: 72, height: 24))
        }
        
        let micSelectBtn = UIButton(type: .custom)
        micSelectBtn.setImage(UIImage(named: "checkbox"), for: .normal)
        micSelectBtn.setImage(UIImage(named: "checkbox_y"), for: .selected)
        micSelectBtn.addTarget(self, action: #selector(micSelectAction), for: .touchUpInside)
        self.view.addSubview(micSelectBtn)
        micSelectBtn.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().inset(8)
            maker.top.equalTo(joinLB.snp.bottom).offset(8)
            maker.size.equalTo(CGSize(width: 32, height: 32))
        }
        
        let videoSelectBtn = UIButton(type: .custom)
        videoSelectBtn.setImage(UIImage(named: "checkbox"), for: .normal)
        videoSelectBtn.setImage(UIImage(named: "checkbox_y"), for: .selected)
        videoSelectBtn.addTarget(self, action: #selector(videoSelectAction), for: .touchUpInside)
        self.view.addSubview(videoSelectBtn)
        videoSelectBtn.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().inset(134)
            maker.top.equalTo(joinLB.snp.bottom).offset(8)
            maker.size.equalTo(CGSize(width: 32, height: 32))
        }
        
        let joinRoomBtn = UIButton(type: .custom)
        joinRoomBtn.setTitle(NSLocalizedString("Join_btnjoin", comment: ""), for: .normal)
        joinRoomBtn.backgroundColor = .hexColor(hex: "#3381FF")
        joinRoomBtn.titleLabel?.font = .systemFont(ofSize: 16)
        joinRoomBtn.addTarget(self, action: #selector(joinRoomAction), for: .touchUpInside)
        joinRoomBtn.makeCornerRadius()
        self.view.addSubview(joinRoomBtn)
        joinRoomBtn.snp.makeConstraints { (maker) in
            maker.left.right.equalToSuperview().inset(16)
            maker.bottom.equalToSuperview().inset(32)
            maker.height.equalTo(40)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        }
    }
    
    @objc func micSelectAction(_ button: UIButton) {
        button.isSelected = !button.isSelected
    }
    
    @objc func videoSelectAction(_ button: UIButton) {
        button.isSelected = !button.isSelected
    }
    
    @objc func joinRoomAction() {
        let vc = FlatClassRoomVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
