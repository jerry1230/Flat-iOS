//
//  FlatClassRoomVC.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/21.
//

import UIKit
class FlatClassRoomVC: UIViewController {
    override var shouldAutorotate: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        self.view.backgroundColor = .white
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
        self.loadCtrls()
    }
    
    func loadCtrls(){
        let imgArray:[String] = ["room_exit", "roomPlay", "roomPause"]
        let selectorArray:[Selector] = [#selector(exitAction), #selector(playAction), #selector(pauseAction)]
        for index in 0...2 {
            let roomCtrlBtn = UIButton(type: .custom)
            roomCtrlBtn.setImage(UIImage(named: imgArray[index]), for: .normal)
            roomCtrlBtn.addTarget(self, action: selectorArray[index], for: .touchUpInside)
            roomCtrlBtn.layer.cornerRadius = 16
            roomCtrlBtn.layer.borderWidth = 1
            roomCtrlBtn.layer.borderColor = UIColor.hexColor(hex: "#DBE1EA").cgColor
            self.view.addSubview(roomCtrlBtn)
            roomCtrlBtn.snp.makeConstraints { (maker) in
                maker.top.equalToSuperview().inset(12)
                maker.left.equalToSuperview().inset(12 + index * 44)
                maker.size.equalTo(CGSize(width: 32, height: 32))
            }
        }
        
        //operationCtrlView
        let operationCtrlView = UIView()
        operationCtrlView.layer.cornerRadius = 16
        operationCtrlView.layer.borderWidth = 1
        operationCtrlView.layer.borderColor = UIColor.hexColor(hex: "#DBE1EA").cgColor
        self.view.addSubview(operationCtrlView)
        operationCtrlView.snp.makeConstraints { (maker) in
            maker.bottom.left.equalToSuperview().inset(12)
            maker.size.equalTo(CGSize(width: 64, height: 32))
        }
        
        let previousBtn = UIButton(type: .custom)
        previousBtn.isEnabled = false
        previousBtn.setImage(UIImage(named: "goPrevious_def"), for: .normal)
        previousBtn.setImage(UIImage(named: "goPrevious_disable"), for: .disabled)
        previousBtn.addTarget(self, action: #selector(operationPreviousAction), for: .touchUpInside)
        operationCtrlView.addSubview(previousBtn)
        previousBtn.snp.makeConstraints { (maker) in
            maker.top.left.bottom.equalToSuperview()
            maker.width.equalTo(32)
        }
        
        let nextBtn = UIButton(type: .custom)
        nextBtn.isEnabled = false
        nextBtn.setImage(UIImage(named: "goNext_def"), for: .normal)
        nextBtn.setImage(UIImage(named: "goNext_disable"), for: .disabled)
        nextBtn.addTarget(self, action: #selector(operationPreviousAction), for: .touchUpInside)
        operationCtrlView.addSubview(nextBtn)
        nextBtn.snp.makeConstraints { (maker) in
            maker.top.right.bottom.equalToSuperview()
            maker.width.equalTo(32)
        }
        
        
        //scaleCtrlView
        let scaleCtrlView = UIView()
        scaleCtrlView.layer.cornerRadius = 16
        scaleCtrlView.layer.borderWidth = 1
        scaleCtrlView.layer.borderColor = UIColor.hexColor(hex: "#DBE1EA").cgColor
        self.view.addSubview(scaleCtrlView)
        scaleCtrlView.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().inset(88)
            maker.bottom.equalToSuperview().inset(12)
            maker.size.equalTo(CGSize(width: 64, height: 32))
        }
        
        let focusBtn = UIButton(type: .custom)
        focusBtn.isEnabled = false
        focusBtn.setImage(UIImage(named: "focus_def"), for: .normal)
        focusBtn.setImage(UIImage(named: "focus_sel"), for: .selected)
        focusBtn.addTarget(self, action: #selector(operationPreviousAction), for: .touchUpInside)
        scaleCtrlView.addSubview(focusBtn)
        focusBtn.snp.makeConstraints { (maker) in
            maker.top.left.bottom.equalToSuperview()
            maker.width.equalTo(32)
        }
        
        let viewFitBtn = UIButton(type: .custom)
        viewFitBtn.isEnabled = false
        viewFitBtn.setImage(UIImage(named: "pages_def"), for: .normal)
        viewFitBtn.setImage(UIImage(named: "pages_sel"), for: .selected)
        viewFitBtn.addTarget(self, action: #selector(operationPreviousAction), for: .touchUpInside)
        scaleCtrlView.addSubview(viewFitBtn)
        viewFitBtn.snp.makeConstraints { (maker) in
            maker.top.right.bottom.equalToSuperview()
            maker.width.equalTo(32)
        }
        
        //pptOperateView
        let pptCtrlView = UIView()
        pptCtrlView.layer.cornerRadius = 16
        pptCtrlView.layer.borderWidth = 1
        pptCtrlView.layer.borderColor = UIColor.hexColor(hex: "#DBE1EA").cgColor
        self.view.addSubview(pptCtrlView)
        pptCtrlView.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().inset(164)
            maker.bottom.equalToSuperview().inset(12)
            maker.size.equalTo(CGSize(width: 86, height: 32))
        }
        let pageUpBtn = UIButton(type: .custom)
        pageUpBtn.isEnabled = false
        pageUpBtn.setImage(UIImage(named: "pageUp_def"), for: .normal)
        pageUpBtn.setImage(UIImage(named: "pageUp_disable"), for: .disabled)
        pageUpBtn.addTarget(self, action: #selector(operationPreviousAction), for: .touchUpInside)
        pptCtrlView.addSubview(pageUpBtn)
        pageUpBtn.snp.makeConstraints { (maker) in
            maker.top.left.bottom.equalToSuperview()
            maker.width.equalTo(32)
        }
        let pageDownBtn = UIButton(type: .custom)
        pageDownBtn.isEnabled = false
        pageDownBtn.setImage(UIImage(named: "pageDown_def"), for: .normal)
        pageDownBtn.setImage(UIImage(named: "pageDown_disable"), for: .disabled)
        pageDownBtn.addTarget(self, action: #selector(operationPreviousAction), for: .touchUpInside)
        pptCtrlView.addSubview(pageDownBtn)
        pageDownBtn.snp.makeConstraints { (maker) in
            maker.top.right.bottom.equalToSuperview()
            maker.width.equalTo(32)
        }
        let pageInfoLB = UILabel()
        pageInfoLB.font = .systemFont(ofSize: 14)
        pageInfoLB.textColor = .hexColor(hex: "#444E60")
        pageInfoLB.text = "1/4"
        pptCtrlView.addSubview(pageInfoLB)
        pageInfoLB.snp.makeConstraints { maker in
            maker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32))
        }
        
        
        //roomCtrlView
        let roomCtrlView = UIView()
        roomCtrlView.layer.cornerRadius = 16
        roomCtrlView.layer.borderWidth = 1
        roomCtrlView.layer.borderColor = UIColor.hexColor(hex: "#DBE1EA").cgColor
        self.view.addSubview(roomCtrlView)
        roomCtrlView.snp.makeConstraints { (maker) in
            maker.top.right.equalToSuperview().inset(12)
            maker.size.equalTo(CGSize(width: 32, height: 160))
        }
        
        let btnImgArray:[(String,String)] = [("roomtool_chat_def","roomtool_chat_sel"), ("roomtool_cloud_def","roomtool_cloud_sel"), ("roomtool_invite_def","roomtool_invite_sel"),("roomtool_setting_def","roomtool_setting_sel"),("roomtool_section_def","roomtool_section_open")]
        let roomSelectorArray:[Selector] = [#selector(roomAction), #selector(roomAction), #selector(roomAction), #selector(roomAction), #selector(roomAction)]
        for index in 0...4 {
            let roomCtrlBtn = UIButton(type: .custom)
            roomCtrlBtn.setImage(UIImage(named: btnImgArray[index].0), for: .normal)
            roomCtrlBtn.setImage(UIImage(named: btnImgArray[index].1), for: .selected)
            roomCtrlBtn.addTarget(self, action: roomSelectorArray[index], for: .touchUpInside)
            roomCtrlView.addSubview(roomCtrlBtn)
            roomCtrlBtn.snp.makeConstraints { (maker) in
                maker.top.equalToSuperview().inset(index * 32)
                maker.left.right.equalToSuperview()
                maker.size.equalTo(CGSize(width: 32, height: 32))
            }
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    @objc func exitAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func playAction() {
    }
    
    @objc func pauseAction() {
    }
    
    @objc func operationPreviousAction() {
    }
    
    @objc func operationNextAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func roomAction() {
        
    }
}
