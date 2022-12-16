//
//  DBLCustomView.swift
//  DouBaoLee
//
//  Created by 李开强 on 2022/11/22.
//  Copyright © 2022 李开强. All rights reserved.
//

import UIKit

protocol DBLCustomViewDelegate:NSObjectProtocol {
    func clickCustomView(name: String)
}


class DBLCustomView: UIView {
    
    weak var delegate: DBLCustomViewDelegate?
    
    
    var titleLabel: UILabel?
    var titleButton: UIButton?
    
    var model: DBLListModel? {
        didSet {
            self.titleLabel?.text = self.model?.productName
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpUI()
    }
    
    
    func setUpUI() {
        self.titleLabel = UILabel.init()
        self.titleLabel?.textColor = UIColor.red
        self.addSubview(self.titleLabel!)
        
        self.titleButton = UIButton(type: UIButton.ButtonType.contactAdd)
        self.titleButton?.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        self.addSubview(self.titleButton!)
    }
    @objc func clickButton() {
        self.delegate?.clickCustomView(name: self.model?.productName ?? "")
    }
    
    
    override func layoutSubviews() {
        self.titleLabel?.frame = CGRect(x: 0,
                                        y: 0,
                                        width: self.frame.size.width,
                                        height: self.frame.size.height)
        self.titleButton?.frame = CGRect(x: self.frame.size.width - self.frame.size.height,
                                         y: 0,
                                         width: self.frame.size.height,
                                         height: self.frame.size.height)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
