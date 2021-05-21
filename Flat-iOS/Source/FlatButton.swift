//
//  FlatButton.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/21.
//

import UIKit
class FlatPickerButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(named:"icon_picker"), for: .normal)
        self.setTitleColor(.hexColor(hex: "#444E60"), for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 16)
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.hexColor(hex: "#DBE1EA").cgColor
        self.contentHorizontalAlignment = .left
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let label_offset = self.width - 24 - 8
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: label_offset, bottom: 0, right: -label_offset )
    }
}

enum FlatRoomType:Int {
    case miniClass = 100
    case bigClass = 101
    case smallClass = 102
    var description: (name:String,image:String) {
        switch self {
        case .miniClass:
            return (name: "Create_oneclass", image:"onetoone")
        case .bigClass:
            return (name: "Create_bigclass", image:"bigclass")
        case .smallClass:
            return (name: "Create_smallclass", image:"smallclass")
        }
    }
}

class FlatRoomButton: UIButton {
    init(type:FlatRoomType){
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: 104, height: 140)))
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.hexColor(hex: "#DBE1EA").cgColor
        self.contentHorizontalAlignment = .left
        self.contentVerticalAlignment = .top
        self.setTitle(NSLocalizedString(type.description.name , comment: ""), for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 16)
        self.setTitleColor(.hexColor(hex: "#444E60"), for: .normal)
        let rect = self.titleRect(forContentRect: self.contentRect(forBounds:self.bounds))
        let labe_l = (self.size.width - rect.size.width) / 2
        self.titleEdgeInsets = UIEdgeInsets(top: 106, left: -(88 - labe_l), bottom: -106, right: labe_l)
        self.setImage(UIImage(named: type.description.image), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: -8, right: -8)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool{
        didSet{
            let color = isSelected ? "#3381FF" : "#DBE1EA"
            self.layer.borderColor = UIColor.hexColor(hex: color).cgColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
