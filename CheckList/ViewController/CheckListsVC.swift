//
//  ViewController.swift
//  checkList
//
//  Created by 澈水 on 2022/5/18.
//

import UIKit
import SnapKit

class CheckListsVC: UIViewController{
    
    lazy var checkListsTableView = makecheckListsTableView()
    var checkListItems = [CheckListItem]()
    var addItemVC = AddItemViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Initialize data
        checkListItems.append(CheckListItem(name: "Study swift"))
        checkListItems.append(CheckListItem(name: "Brush my teeth"))
        checkListItems.append(CheckListItem(name: "Learn iOS development"))
        checkListItems.append(CheckListItem(name: "Soccer practice"))
        checkListItems.append(CheckListItem(name: "Eat ice cream"))
        
        navConfig()
    
        view.addSubview(checkListsTableView)
        checkListsTableView.snp.makeConstraints { make in
            make.size.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
    
    func makecheckListsTableView() -> UITableView {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
    }
    
    func navConfig() {
        //Add titles and buttons to the NavigationBar, and modify the style of the NavigationBar
        navigationItem.title = "checkLists"
        navigationController?.navigationBar.tintColor = .orange

        //This is done to test adding multiple UIBarButtonItems
        navigationItem.setRightBarButton(UIBarButtonItem(systemItem: .add), animated: true)
        let rightBtn = navigationItem.rightBarButtonItem
        rightBtn?.target = self
        rightBtn?.action = #selector(addcheckListBtnClicked)
    }
    
    @objc func addcheckListBtnClicked () {
        navigationController?.pushViewController(addItemVC, animated: true)
        addItemVC.delegate = self
    }
}

