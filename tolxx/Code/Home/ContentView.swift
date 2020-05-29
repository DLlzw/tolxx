//
//  ContentView.swift
//  tolxx
//
//  Created by mac on 2020/5/29.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ContentView: UIView,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let array:[String] = ["纯代码自定义cell", "nib自定义cell","纯代码自定义cell", "nib自定义cell","纯代码自定义cell", "nib自定义cell"]
        let cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CellIdentifier")
                cell.textLabel?.text = array[indexPath.row]
                return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

    override init(frame: CGRect) {
        var tableView:UITableView!
        super.init(frame: frame)
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        tableView.delegate = self
        tableView.dataSource = self
        self.addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
