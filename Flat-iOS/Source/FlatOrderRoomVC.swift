//
//  FlatOrderRoomVC.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/13.
//

import UIKit

class FlatOrderRoomVC: UIViewController {
    var curRoomType = FlatRoomType.miniClass
    var scrollView = UIScrollView()
    var regularView:UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .hexColor(hex: "#F3F6F9")
        contentView.makeCornerRadius()
        
        let weekDayLB = UILabel()
        weekDayLB.font = .systemFont(ofSize: 12)
        weekDayLB.textColor = .hexColor(hex: "#3381FF")
        weekDayLB.text = "每周一"
        contentView.addSubview(weekDayLB)
        weekDayLB.snp.makeConstraints { maker in
            maker.left.top.right.equalToSuperview().inset(12)
            maker.height.equalTo(18)
        }
        
        let roomTypeLB = UILabel()
        roomTypeLB.font = .systemFont(ofSize: 12)
        roomTypeLB.textColor = .hexColor(hex: "#7A7B7C")
        roomTypeLB.text = "房间类型：一对一"
        contentView.addSubview(roomTypeLB)
        roomTypeLB.snp.makeConstraints { maker in
            maker.top.equalTo(weekDayLB.snp.bottom).offset(8)
            maker.left.right.equalToSuperview().inset(12)
            maker.height.equalTo(18)
        }
        let desLB = UILabel()
        desLB.font = .systemFont(ofSize: 12)
        desLB.textColor = .hexColor(hex: "#7A7B7C")
        desLB.text = "结束于 2020/11/30 周一，共 7 场会议"
        contentView.addSubview(desLB)
        desLB.snp.makeConstraints { maker in
            maker.top.equalTo(roomTypeLB.snp.bottom).offset(8)
            maker.left.right.equalToSuperview().inset(12)
            maker.height.equalTo(18)
        }
        
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Home_order", comment: "")
        self.view.backgroundColor = .white
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        self.scrollView.showsVerticalScrollIndicator = false
        if #available(iOS 11.0, *) {
            self.scrollView.contentInsetAdjustmentBehavior = .never
        }

        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        let themeLB = UILabel(frame: CGRect())
        themeLB.font = .systemFont(ofSize: 14)
        themeLB.textColor = .hexColor(hex: "#7A7B7C")
        themeLB.text = NSLocalizedString("Create_theme", comment: "")
        self.scrollView.addSubview(themeLB)
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
        self.scrollView.addSubview(themeTF)
        themeTF.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(16)
            maker.top.equalTo(46)
            maker.height.equalTo(48)
        }

        let roomTypeLB = UILabel()
        roomTypeLB.font = .systemFont(ofSize: 14)
        roomTypeLB.textColor = .hexColor(hex: "#7A7B7C")
        roomTypeLB.text = NSLocalizedString("Create_type", comment: "")
        self.scrollView.addSubview(roomTypeLB)
        roomTypeLB.snp.makeConstraints { maker in
            maker.left.equalTo(16)
            maker.top.equalTo(110)
            maker.size.equalTo(CGSize(width: 30, height: 21))
        }
        let roomType:[FlatRoomType] = [.miniClass, .bigClass, .smallClass]
        for index in 0...2 {
            let classBtn = FlatRoomButton(type: roomType[index])
            classBtn.tag = roomType[index].rawValue
            classBtn.isSelected = index == 0 ? true : false
            classBtn.addTarget(self, action: #selector(classSelectedAction), for: .touchUpInside)
            self.scrollView.addSubview(classBtn)
            classBtn.snp.makeConstraints { (maker) in
                maker.left.equalToSuperview().inset(120 * index + 16 )
                maker.top.equalToSuperview().inset(140)
                maker.size.equalTo(CGSize(width: 104, height: 140))
            }
            
            let classStateBtn = UIButton(type: .custom)
            classStateBtn.isSelected = index == 0 ? true : false
            classStateBtn.tag = btnBaseTag + index
            classStateBtn.isUserInteractionEnabled = false
            classStateBtn.setImage(UIImage(named: "round_unselect"), for: .normal)
            classStateBtn.setImage(UIImage(named: "round_select"), for: .selected)
            self.scrollView.addSubview(classStateBtn)
            classStateBtn.snp.makeConstraints { (maker) in
                maker.left.equalToSuperview().inset(120 * index + 60)
                maker.top.equalTo(classBtn.snp.bottom).offset(16)
                maker.size.equalTo(CGSize(width: 16, height: 16))
            }
        }

        self.loadAgreedTimeUI()
        self.loadRegularUI()
        
        let orderBtn = UIButton(type: .custom)
        orderBtn.setTitle(NSLocalizedString("Order_order", comment: ""), for: .normal)
        orderBtn.backgroundColor = .hexColor(hex: "#3381FF")
        orderBtn.titleLabel?.font = .systemFont(ofSize: 16)
        orderBtn.addTarget(self, action: #selector(orderRoomAction), for: .touchUpInside)
        orderBtn.makeCornerRadius()
        self.scrollView.addSubview(orderBtn)
        orderBtn.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview().inset(UIEdgeInsets(top: 894, left: 16, bottom: 32, right: 16))
            maker.width.equalTo(self.scrollView.snp.width).inset(16)
            maker.height.equalTo(40)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        }
    }
    
    func loadRegularUI() {
        let regularStateBtn = UIButton(type: .custom)
        regularStateBtn.contentHorizontalAlignment = .left
        regularStateBtn.setTitle(NSLocalizedString("Order_regular", comment: ""), for: .normal)
        regularStateBtn.setTitleColor(.hexColor(hex: "#7A7B7C"), for: .normal)
        regularStateBtn.titleLabel?.font = .systemFont(ofSize: 14)
        regularStateBtn.setImage(UIImage(named: "round_unselect"), for: .normal)
        regularStateBtn.setImage(UIImage(named: "round_select"), for: .selected)
        regularStateBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
        regularStateBtn.addTarget(self, action: #selector(regularStateChangeAction), for: .touchUpInside)
        self.scrollView.addSubview(regularStateBtn)
        regularStateBtn.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().inset(16)
            maker.top.equalToSuperview().inset(516)
            maker.size.equalTo(CGSize(width: 94, height: 24))
        }
        
        self.scrollView.addSubview(self.regularView)
        self.regularView.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(16)
            maker.top.equalTo(regularStateBtn.snp.bottom).offset(16)
            maker.height.equalTo(94)
        }
        
        let frequentLB = UILabel()
        frequentLB.font = .systemFont(ofSize: 14)
        frequentLB.textColor = .hexColor(hex: "#7A7B7C")
        frequentLB.text = NSLocalizedString("Order_starttime", comment: "")
        self.scrollView.addSubview(frequentLB)
        frequentLB.snp.makeConstraints { maker in
            maker.left.equalTo(16)
            maker.top.equalTo(self.regularView.snp.bottom).offset(16)
            maker.size.equalTo(CGSize(width: 72, height: 24))
        }
        
        let endTimeLB = UILabel()
        endTimeLB.font = .systemFont(ofSize: 14)
        endTimeLB.textColor = .hexColor(hex: "#7A7B7C")
        endTimeLB.text = NSLocalizedString("Order_endtime", comment: "")
        self.scrollView.addSubview(endTimeLB)
        endTimeLB.snp.makeConstraints { maker in
            maker.left.equalTo(16)
            maker.top.equalTo(frequentLB.snp.bottom).offset(72)
            maker.size.equalTo(CGSize(width: 72, height: 24))
        }
        
        let frequentBtn = FlatPickerButton(frame: .zero)
        frequentBtn.setTitle("周一、周二", for: .normal)
        self.scrollView.addSubview(frequentBtn)
        frequentBtn.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(16)
            maker.top.equalTo(frequentLB.snp.bottom).offset(8)
            maker.height.equalTo(48)
        }
        
        let endDateBtn = FlatPickerButton()
        endDateBtn.setTitle("2021/2/25", for: .normal)
        self.scrollView.addSubview(endDateBtn)
        
        let endTimeBtn = FlatPickerButton()
        endTimeBtn.setTitle("16:30", for: .normal)
        self.scrollView.addSubview(endTimeBtn)
        
        endDateBtn.snp.makeConstraints { maker in
            maker.top.equalTo(endTimeLB.snp.bottom).offset(8)
            maker.left.equalToSuperview().inset(16)
            maker.height.equalTo(48)
        }

        endTimeBtn.snp.makeConstraints { maker in
            maker.top.equalTo(endTimeLB.snp.bottom).offset(8)
            maker.height.equalTo(48)
            maker.left.equalTo(endDateBtn.snp.right).offset(15)
            maker.right.equalToSuperview().inset(16)
            maker.width.equalTo(endDateBtn.snp.width)
        }
    }
    
    func loadAgreedTimeUI() {
        let startTimeLB = UILabel()
        startTimeLB.font = .systemFont(ofSize: 14)
        startTimeLB.textColor = .hexColor(hex: "#7A7B7C")
        startTimeLB.text = NSLocalizedString("Order_starttime", comment: "")
        self.scrollView.addSubview(startTimeLB)
        startTimeLB.snp.makeConstraints { maker in
            maker.left.equalTo(16)
            maker.top.equalTo(328)
            maker.size.equalTo(CGSize(width: 72, height: 24))
        }
        
        let endTimeLB = UILabel()
        endTimeLB.font = .systemFont(ofSize: 14)
        endTimeLB.textColor = .hexColor(hex: "#7A7B7C")
        endTimeLB.text = NSLocalizedString("Order_endtime", comment: "")
        self.scrollView.addSubview(endTimeLB)
        endTimeLB.snp.makeConstraints { maker in
            maker.left.equalTo(16)
            maker.top.equalTo(startTimeLB.snp.bottom).offset(72)
            maker.size.equalTo(CGSize(width: 72, height: 24))
        }
        
        for index in 0...3 {
            let pikerBtn = FlatPickerButton(type: .custom)
            self.scrollView.addSubview(pikerBtn)
            pikerBtn.snp.makeConstraints { maker in
                maker.left.equalTo(16 + index % 2 * 179)
                maker.top.equalTo(startTimeLB.snp.bottom).offset(8 + index / 2 * 96)
                maker.size.equalTo(CGSize(width: 164, height: 48))
            }
        }
    }
    
    @objc func classSelectedAction(_ button: UIButton) {
        if button.tag != self.curRoomType.rawValue {
            let preSelBtn = self.scrollView.viewWithTag(self.curRoomType.rawValue) as! UIButton
            let preStateBtn = self.scrollView.viewWithTag(self.curRoomType.rawValue + 100) as! UIButton
            preSelBtn.isSelected = false
            preStateBtn.isSelected = false
            button.isSelected = true
            let nowStatebtn = self.scrollView.viewWithTag(button.tag + 100) as! UIButton
            nowStatebtn.isSelected = true
            self.curRoomType = FlatRoomType(rawValue: button.tag)!
        }
    }
    
    @objc func regularStateChangeAction(_ button: UIButton) {
        button.isSelected = !button.isSelected
    }
    
    @objc func orderRoomAction() {
        
    }
    
    @objc func pickerAction() {
        
    }
}
