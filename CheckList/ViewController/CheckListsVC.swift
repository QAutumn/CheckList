//
//  ViewController.swift
//  checkList
//
//  Created by 澈水 on 2022/5/18.
//

import UIKit
import SnapKit

class CheckListsVC: UIViewController{
    
    lazy var checkListTableView = makecheckListTableView()
    var checkListItems = [CheckListItem]()
    var addItemVC = ItemDetailViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Initialize data
        checkListItems.append(CheckListItem(name: "Study swift"))
        checkListItems.append(CheckListItem(name: "Brush my teeth"))
        checkListItems.append(CheckListItem(name: "Learn iOS development"))
        checkListItems.append(CheckListItem(name: "Soccer practice"))
        checkListItems.append(CheckListItem(name: "Eat ice cream"))
        
        configNavagationBar()
        addItemVC.delegate = self
        
        view.addSubview(checkListTableView)
        checkListTableView.snp.makeConstraints { make in
            make.size.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        print("Document folder is \(documentsDirectory())")
        print("dataFile Path is \(dataFilePath())")
    }
    
    func makecheckListTableView() -> UITableView {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
    }
    
    func configNavagationBar() {
        //Add titles and buttons to the NavigationBar, and modify the style of the NavigationBar
        navigationItem.title = "Check Lists"
        navigationController?.navigationBar.tintColor = .orange
        //This is done to test adding multiple UIBarButtonItems
        navigationItem.setRightBarButton(UIBarButtonItem(systemItem: .add), animated: true)
        let rightBtn = navigationItem.rightBarButtonItem
        rightBtn?.target = self
        rightBtn?.action = #selector(addcheckListBtnClicked)
        
        // 测试
    }
    
    func documentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func dataFilePath() -> URL {
        documentsDirectory().appendingPathComponent("checklists.plist")
    }
}

