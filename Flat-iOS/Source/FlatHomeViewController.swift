//
//  FlatHomeViewController.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/12.
//

import UIKit
import SnapKit

final class FlatHomeViewController: UIViewController {

    let sectionHeader = UIView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: 48)))
    public enum ListType:Int {
        case RoomList = 100
        case HistoryRecord = 101
    }
    
    let STATUSBAR_HEIGHT = UIApplication.shared.statusBarFrame.height
    let tableView = UITableView()
    let selectLine = UIView(frame: .zero)
    var curList:ListType = .RoomList
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
            if(button.tag == ListType.RoomList.rawValue){
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
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = UITableViewCell(style: .default, reuseIdentifier: "FlatHomeCell")
        homeCell.textLabel?.text = String(indexPath.row)
        return homeCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.sectionHeader.backgroundColor = .white
        let listBtn = UIButton(type: .custom)
        listBtn.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width/2, height: 48)
        listBtn.tag = ListType.RoomList.rawValue
        listBtn.titleLabel?.font = .systemFont(ofSize: 14)
        listBtn.setTitle(NSLocalizedString("Home_list", comment: ""), for: .normal)
        listBtn.setTitleColor(.hexColor(hex: "#444E60").withAlphaComponent(0.5), for: .normal)
        listBtn.setTitleColor(.hexColor(hex: "#444E60"), for: .selected)
        listBtn.addTarget(self, action: #selector(listChangeAction), for: .touchUpInside)
        self.sectionHeader.addSubview(listBtn)

        let historyBtn = UIButton(type: .custom)
        historyBtn.tag = ListType.HistoryRecord.rawValue
        historyBtn.frame = CGRect(x: UIScreen.main.bounds.width/2, y: 0, width: UIScreen.main.bounds.width/2, height: 48)
        historyBtn.setTitle(NSLocalizedString("Home_history", comment: ""), for: .normal)
        historyBtn.titleLabel?.font = .systemFont(ofSize: 14)
        historyBtn.setTitleColor(.hexColor(hex: "#444E60").withAlphaComponent(0.5), for: .normal)
        historyBtn.setTitleColor(.hexColor(hex: "#444E60"), for: .selected)
        historyBtn.addTarget(self, action: #selector(listChangeAction), for: .touchUpInside)
        self.sectionHeader.addSubview(historyBtn)

        self.selectLine.backgroundColor = .hexColor(hex: "#3381FF")
        self.sectionHeader.addSubview(self.selectLine)

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

        self.selectLine.snp.makeConstraints { maker in
            maker.left.bottom.equalToSuperview()
            maker.height.equalTo(2)
            maker.width.equalToSuperview().dividedBy(2)
        }
        return self.sectionHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    
    
}


extension UIViewController {
    @available(iOS 11.0, *)
    func setLargeTitleDisplayMode(_ largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode) {
        switch largeTitleDisplayMode {
        case .automatic:
              guard let navigationController = navigationController else { break }
            if let index = navigationController.children.firstIndex(of: self) {
                setLargeTitleDisplayMode(index == 0 ? .always : .never)
            } else {
                setLargeTitleDisplayMode(.always)
            }
        case .always, .never:
            navigationItem.largeTitleDisplayMode = largeTitleDisplayMode
            // Even when .never, needs to be true otherwise animation will be broken on iOS11, 12, 13
            navigationController?.navigationBar.prefersLargeTitles = true
        @unknown default:
            assertionFailure("\(#function): Missing handler for \(largeTitleDisplayMode)")
        }
    }
}
