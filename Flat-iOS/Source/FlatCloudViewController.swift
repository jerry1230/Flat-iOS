//
//  FlatCloudViewController.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/12.
//

import UIKit
import SnapKit

final class FlatCloudViewController: UIViewController {
    let tableView = UITableView()
    let storageLabel = UILabel()
    let deleteBtn = UIButton(type: .custom)
    var isEdit = false

    lazy var headerView:UIView = {
        let headerView = UIView()
        headerView.height = 46
        headerView.backgroundColor = .hexColor(hex: "#F3F6F9")
        self.storageLabel.textColor = .hexColor(hex: "#7A7B7C")
        headerView.addSubview(self.storageLabel)
        
        let editBtn = UIButton(type: .custom)
        editBtn.setTitleColor(.hexColor(hex: "#3381FF"), for: .normal)
        editBtn.setTitle(NSLocalizedString("Cloud_edit", comment: ""), for: .normal)
        editBtn.setTitle(NSLocalizedString("Cloud_done", comment: ""), for: .selected)
        editBtn.setImage(UIImage(named: "btn_edit"), for: .normal)
        editBtn.setImage(UIImage(named: "btn_done"), for: .selected)
        editBtn.titleLabel?.font = .systemFont(ofSize: 14)
        editBtn.addTarget(self, action: #selector(cloudEditAction), for: .touchUpInside)
        headerView.addSubview(editBtn)
        
        self.deleteBtn.setTitleColor(.hexColor(hex: "#F45454"), for: .normal)
        self.deleteBtn.setTitle(NSLocalizedString("Cloud_delete", comment: ""), for: .normal)
        self.deleteBtn.setImage(UIImage(named: "btn_delete"), for: .normal)
        self.deleteBtn.titleLabel?.font = .systemFont(ofSize: 14)
        self.deleteBtn.addTarget(self, action: #selector(cloudDeleteAction), for: .touchUpInside)
        headerView.addSubview(self.deleteBtn)

        self.storageLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview().offset(16)
            maker.top.equalToSuperview().offset(12)
            maker.bottom.equalToSuperview().offset(-12)
            maker.width.equalTo(120)
        }
        
        editBtn.snp.makeConstraints { maker in
            maker.right.equalToSuperview().offset(-16)
            maker.top.equalToSuperview().offset(12)
            maker.height.equalTo(24)
            maker.width.equalTo(61)
        }
        
        self.deleteBtn.snp.makeConstraints { maker in
            maker.right.equalToSuperview().offset(-92)
            maker.top.equalToSuperview().offset(12)
            maker.height.equalTo(24)
            maker.width.equalTo(61)
        }
        return headerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            self.navigationItem.title = NSLocalizedString("Flat_cloud", comment: "")
            self.navigationItem.largeTitleDisplayMode = .always
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.largeTitleTextAttributes = [.font : UIFont.boldSystemFont(ofSize: 34)]
        } else {
            
            self.title = NSLocalizedString("Flat_cloud", comment: "")
        
        }
        
        self.tableView.rowHeight = 69
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .always
        }
    }
}

// MARK: - @protocol UITableViewDelegate
extension FlatCloudViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

// MARK: - @protocol UITableViewDataSource
extension FlatCloudViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cloudCell = FlatCloudCell(style: .subtitle, reuseIdentifier: "FlatCloudCell")
        cloudCell.loadData(CloudFile())
        cloudCell.checkboxBtn.addTarget(self, action: #selector(fileSelectedAction), for: .touchUpInside)
        cloudCell.isSelecting = self.isEdit
        return cloudCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.storageLabel.text = String(format: NSLocalizedString("Cloud_storage", comment: ""), "102 MB")
        self.deleteBtn.isHidden = !self.isEdit
        return self.headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 46
    }
    
    @objc func cloudEditAction(_ button:UIButton) {
        button.isSelected = !button.isSelected
        self.isEdit = button.isSelected
        self.deleteBtn.isHidden = false //!button.isSelected
        self.tableView.reloadData()
    }
    
    @objc func cloudDeleteAction(_ button:UIButton) {
        self.tableView.reloadData()
    }
    
    @objc func fileSelectedAction(_ button:UIButton) {
        button.isSelected = !button.isSelected
    }
}


public class FlatCloudCell: UITableViewCell{
    let iconArray:[String] = ["cloud_ppt", "bigclass", "smallclass"]
    let checkboxBtn = UIButton(type: .custom)
    var isSelecting = false{
        didSet{
            self.checkboxBtn.isHidden = !isSelecting
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        self.selectionStyle = .none
        self.contentView.backgroundColor = .white
        self.textLabel?.textColor = .hexColor(hex: "#444E60")
        self.detailTextLabel?.textColor = .hexColor(hex: "#DBE1EA")
        self.checkboxBtn.setImage(UIImage(named: "checkbox"), for: .normal)
        self.checkboxBtn.setImage(UIImage(named: "checkbox_y"), for: .selected)
        self.contentView.addSubview(self.checkboxBtn)
        self.checkboxBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(18)
            make.bottom.equalToSuperview().offset(-18)
            make.right.equalToSuperview().offset(-8)
            make.width.equalTo(32)
        }
    }
    
    func loadData(_ file:CloudFile){
        self.imageView?.image = UIImage(named: file.type.rawValue)
        self.textLabel?.text = file.name
        self.detailTextLabel?.text = file.time + "  " + file.sizeDes
    }
    
}

class CloudFile: NSObject {
    enum cloudFileType:String {
        case fileImage = "cloud_image"
        case filePDF = "cloud_pdf"
        case fileVideo = "cloud_video"
        case fileMusic = "cloud_music"
        case fileWord = "cloud_word"
        case filePPT = "cloud_ppt"
    }
    var type:cloudFileType
    var name:String
    var time:String
    var size:Float
    var sizeDes:String
    
    required override init() {
        type = .fileImage
        name = "文件名"
        time = "17:26:03"
        size = 1024.0
        sizeDes = "1M"
    }
}
