//
//  ViewController.swift
//  DouBaoLee
//
//  Created by 李开强 on 2022/11/15.
//  Copyright © 2022 李开强. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DBLCustomViewDelegate {
    
    // ------ 变量声明
    var tableView : UITableView?
    var model: DBLModel?
    
    
    // ------ 获取本地数据
    func readLocalFileWithName(name:String) -> DBLModel {
        let pathString = Bundle.main.path(forResource: name, ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: pathString!))
        let model = try! JSONDecoder().decode(DBLModel.self, from: data)
        return model
    }
    
    
    // ------ 元素创建
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "DouBaoLee"
        
        self.model = self.readLocalFileWithName(name: "Data")
        
        self.tableView = UITableView(frame: CGRect(x: 0,
                                                   y: 0,
                                                   width: UIScreen.main.bounds.size.width,
                                                   height: UIScreen.main.bounds.size.height),
                                     style: UITableView.Style.grouped);
        self.tableView?.delegate = self;
        self.tableView?.dataSource = self;
        self.view.addSubview(self.tableView!)
        
    }
    
    // ------ 代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let iderntify:String = "DBLTableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: iderntify) as? DBLTableViewCell
        if cell == nil{
            cell = DBLTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: iderntify)
        }
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        cell?.customView?.delegate = self
        let data = self.model?.list[indexPath.row]
        cell?.model = data
        return cell!
    }
    
    func clickCustomView(name: String) {
        print(name)
    }
}

