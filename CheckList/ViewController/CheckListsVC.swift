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
        
        navConfig()
        
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
    
    func navConfig() {
        //Add titles and buttons to the NavigationBar, and modify the style of the NavigationBar
        navigationItem.title = "CheckLists"
        navigationController?.navigationBar.tintColor = .orange
        navigationController?.navigationBar.barTintColor = .blue

        //This is done to test adding multiple UIBarButtonItems
        var barButtonItems = [UIBarButtonItem]()
        barButtonItems.append(UIBarButtonItem(systemItem: .add))
        //barButtonItems.append(UIBarButtonItem(systemItem: .camera))
        navigationItem.setRightBarButtonItems(barButtonItems, animated: true)
        let addChecklistBtn = navigationItem.rightBarButtonItems?[0]
        addChecklistBtn?.target = self
        addChecklistBtn?.action = #selector(addChecklistBtnClicked)
    }
    
    @objc func addChecklistBtnClicked () {
        checklistItems.append(ChecklistItem(name: "❤️", checked: true))
        checkListsTableView.reloadData()
    }
}

