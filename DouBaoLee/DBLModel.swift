//
//  DBLModel.swift
//  DouBaoLee
//
//  Created by 李开强 on 2022/11/22.
//  Copyright © 2022 李开强. All rights reserved.
//

import UIKit


struct DBLListModel:Codable {
    let productName: String
    
}

struct DBLModel:Codable {
    let name: String
    var list: [DBLListModel]
}

