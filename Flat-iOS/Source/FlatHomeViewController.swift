//
//  FlatHomeViewController.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/12.
//

import UIKit
import SnapKit

final class FlatHomeViewController: UIViewController {

    public enum ListType:Int {
        case RoomList = 100
        case HistoryRecord = 101
    }
    
    let STATUSBAR_HEIGHT = UIApplication.shared.statusBarFrame.height
    let tableView = UITableView()
    let selectLine = UIView(frame: .zero)
    var curList:ListType = .RoomList
    
    lazy var sectionHeader: UIView = {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: 48)))
        view.backgroundColor = .white
        let listBtn = UIButton(type: .custom)
        listBtn.tag = ListType.RoomList.rawValue
        listBtn.titleLabel?.font = .systemFont(ofSize: 14)
        listBtn.setTitle(NSLocalizedString("Home_list", comment: ""), for: .normal)
        listBtn.setTitleColor(.hexColor(hex: "#444E60").withAlphaComponent(0.5), for: .normal)
        listBtn.setTitleColor(.hexColor(hex: "#444E60"), for: .selected)
        listBtn.addTarget(self, action: #selector(listChangeAction), for: .touchUpInside)
        view.addSubview(listBtn)

        let historyBtn = UIButton(type: .custom)
        historyBtn.tag = ListType.HistoryRecord.rawValue
        historyBtn.setTitle(NSLocalizedString("Home_history", comment: ""), for: .normal)
        historyBtn.titleLabel?.font = .systemFont(ofSize: 14)
        historyBtn.setTitleColor(.hexColor(hex: "#444E60").withAlphaComponent(0.5), for: .normal)
        historyBtn.setTitleColor(.hexColor(hex: "#444E60"), for: .selected)
        historyBtn.addTarget(self, action: #selector(listChangeAction), for: .touchUpInside)
        view.addSubview(historyBtn)

        self.selectLine.backgroundColor = .hexColor(hex: "#3381FF")
        view.addSubview(self.selectLine)

        listBtn.snp.makeConstraints { maker in
            maker.top.left.bottom.equalToSuperview()
            maker.width.equalToSuperview().dividedBy(2)
            maker.height.equalTo(48)
        }

        historyBtn.snp.makeConstraints { maker in
            maker.top.bottom.right.equalToSuperview()
            maker.height.equalTo(48)
            maker.width.equalToSuperview().dividedBy(2)
        }
        
        self.selectLine.snp.remakeConstraints { maker in
            maker.left.bottom.equalToSuperview()
            maker.height.equalTo(2)
            maker.width.equalToSuperview().dividedBy(2)
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            self.navigationItem.title = NSLocalizedString("Flat_home", comment: "")
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.largeTitleTextAttributes = [.font : UIFont.boldSystemFont(ofSize: 34)]
        } else {
            
            self.title = NSLocalizedString("Flat_home", comment: "")
            
//            let titleLabel = UILabel(frame: CGRect(x: 16, y: 16 + STATUSBAR_HEIGHT, width: 70, height: 48))
//            titleLabel.font = .boldSystemFont(ofSize: 20)
//            titleLabel.textColor = .flatTextColor()
//            titleLabel.backgroundColor = .white
//            titleLabel.text = NSLocalizedString("Flat_home", comment: "")
//            self.view.addSubview(titleLabel)
        }
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        self.loadTableHeader()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .always
        }
    }
    
    func loadTableHeader() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 110))
        headerView.bottomBorder(width: 1, borderColor: .hexColor(hex: "#DBE1EA"))
        self.tableView.tableHeaderView = headerView
        self.tableView.delegate = self
        self.tableView.dataSource = self

        let joinRoomBtn = UIButton(type: .custom)
        joinRoomBtn.setImage(UIImage(named: "Btn_join"), for: .normal)
        joinRoomBtn.addTarget(self, action: #selector(joinRoomAction), for: .touchUpInside)
        headerView.addSubview(joinRoomBtn)
        joinRoomBtn.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().offset(41)
            maker.top.equalToSuperview().offset(16)
            maker.width.height.equalTo(44)
        }

        let joinRoomLabel = UILabel()
        joinRoomLabel.text = NSLocalizedString("Home_join", comment: "")
        joinRoomLabel.font = .systemFont(ofSize: 12)
        joinRoomLabel.textColor = .hexColor(hex: "#444E60")
        headerView.addSubview(joinRoomLabel)
        joinRoomLabel.snp.makeConstraints { maker in
            maker.centerX.equalTo(joinRoomBtn.snp.centerX)
            maker.top.equalTo(joinRoomBtn.snp.bottom).offset(8)
            maker.size.equalTo(CGSize(width: 50, height: 18))
        }
        

        let createRoomBtn = UIButton(type: .custom)
        createRoomBtn.setImage(UIImage(named: "Btn_create"), for: .normal)
        createRoomBtn.addTarget(self, action: #selector(createRoomAction), for: .touchUpInside)
        headerView.addSubview(createRoomBtn)
        createRoomBtn.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().offset(16)
            maker.width.height.equalTo(44)
        }
        
        let createRoomLabel = UILabel()
        createRoomLabel.text = NSLocalizedString("Home_create", comment: "")
        createRoomLabel.font = .systemFont(ofSize: 12)
        createRoomLabel.textColor = .hexColor(hex: "#444E60")
        headerView.addSubview(createRoomLabel)
        createRoomLabel.snp.makeConstraints { maker in
            maker.centerX.equalTo(createRoomBtn.snp.centerX)
            maker.top.equalTo(createRoomBtn.snp.bottom).offset(8)
            maker.size.equalTo(CGSize(width: 50, height: 18))
        }


        let orderRoomBtn = UIButton(type: .custom)
        orderRoomBtn.setImage(UIImage(named: "Btn_order"), for: .normal)
        orderRoomBtn.addTarget(self, action: #selector(orderRoomAction), for: .touchUpInside)
        headerView.addSubview(orderRoomBtn)
        orderRoomBtn.snp.makeConstraints { (maker) in
            maker.right.equalToSuperview().offset(-41)
            maker.top.equalToSuperview().offset(16)
            maker.width.height.equalTo(44)
        }
        
        let orderRoomLabel = UILabel()
        orderRoomLabel.text = NSLocalizedString("Home_order", comment: "")
        orderRoomLabel.font = .systemFont(ofSize: 12)
        orderRoomLabel.textColor = .hexColor(hex: "#444E60")
        headerView.addSubview(orderRoomLabel)
        orderRoomLabel.snp.makeConstraints { maker in
            maker.centerX.equalTo(orderRoomBtn.snp.centerX)
            maker.top.equalTo(orderRoomBtn.snp.bottom).offset(8)
            maker.size.equalTo(CGSize(width: 50, height: 18))
        }
    }
    
    func loadBlueLine() {
        if(self.curList == ListType.RoomList){
            self.selectLine.snp.remakeConstraints { maker in
                maker.left.bottom.equalToSuperview()
                maker.height.equalTo(2)
                maker.width.equalToSuperview().dividedBy(2)
            }
        }else{
            self.selectLine.snp.remakeConstraints { maker in
                maker.right.bottom.equalToSuperview()
                maker.height.equalTo(2)
                maker.width.equalToSuperview().dividedBy(2)
            }
        }
        UIView.animate(withDuration: 0.3) {
            self.selectLine.setNeedsLayout()
            self.selectLine.layoutIfNeeded()
        }
    }
    
    @objc func joinRoomAction() {
        let vc = FlatJoinRoomVC()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func createRoomAction() {
        let vc = FlatCreateRoomVC()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func orderRoomAction() {
        let vc = FlatOrderRoomVC()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func listChangeAction(_ button: UIButton) {
        print(button.titleLabel?.text ?? "")
        let actionList:ListType = button.tag == ListType.RoomList.rawValue ? .RoomList : .HistoryRecord
        guard self.curList == actionList else {
            button.isSelected = true
            let preSelBtn = self.sectionHeader.viewWithTag(self.curList.rawValue) as! UIButton
            preSelBtn.isSelected = false
            self.curList = actionList
            self.loadBlueLine()
            self.tableView.reloadData()
            return
        }
    }
}

// MARK: - @protocol UITableViewDelegate
extension FlatHomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

// MARK: - @protocol UITableViewDataSource
extension FlatHomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curList == .RoomList ? 3 : 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = UITableViewCell(style: .default, reuseIdentifier: "FlatHomeCell")
        homeCell.textLabel?.text = String(indexPath.row)
        return homeCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.sectionHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    
    
}
