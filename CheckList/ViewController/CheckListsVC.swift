//
//  ViewController.swift
//  CheckList
//
//  Created by 澈水 on 2022/5/18.
//

import UIKit
import SnapKit

class CheckListsVC: UIViewController {
    
    lazy var checkListsTableView = makeCheckListsTableView()
    var checklistItems = Array<ChecklistItem>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Initialize data
        checklistItems.append(ChecklistItem(name: "Study swift"))
        checklistItems.append(ChecklistItem(name: "Brush my teeth"))
        checklistItems.append(ChecklistItem(name: "Learn iOS development"))
        checklistItems.append(ChecklistItem(name: "Soccer practice"))
        checklistItems.append(ChecklistItem(name: "Eat ice cream"))
        
        view.addSubview(checkListsTableView)
        checkListsTableView.snp.makeConstraints { make in
            make.size.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
    
    func makeCheckListsTableView() -> UITableView {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
    }
}

