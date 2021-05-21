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
