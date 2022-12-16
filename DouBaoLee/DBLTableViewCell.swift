//
//  DBLTableViewCell.swift
//  DouBaoLee
//
//  Created by 李开强 on 2022/11/22.
//  Copyright © 2022 李开强. All rights reserved.
//

import UIKit

class DBLTableViewCell: UITableViewCell {

    var customView: DBLCustomView?
    // 接收数据并更新
    var model: DBLListModel? {
        didSet {
            self.customView?.model = self.model
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    
    override func layoutSubviews() {
        self.customView?.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
    }
    
    
    func setUpUI() {
        self.customView = DBLCustomView.init()
        self.contentView.addSubview(self.customView!)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
