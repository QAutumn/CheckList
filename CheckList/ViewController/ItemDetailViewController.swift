//
//  AddItemViewController.swift
//  checkList
//
//  Created by 澈水 on 2022/5/20.
//

import UIKit
import SnapKit

protocol ItemDetailViewControllerDelegate: AnyObject {
    func addItemViewControllerDidCancel(_ controller: ItemDetailViewController)
    func addItemViewController(_ controller: ItemDetailViewController, didfinishAdding item: CheckListItem)
    func addItemViewController(_ controller: ItemDetailViewController, didfinishEditing item: CheckListItem, newName name: String)
}

class ItemDetailViewController: UIViewController {
    
    lazy var textfield = makeItemTextField()
    weak var delegate: ItemDetailViewControllerDelegate?
    var itemToEdit: CheckListItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(textfield)
        textfield.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(navigationController?.navigationBar.frame.maxY ?? 0)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navConfig()
        textfield.becomeFirstResponder()
        textfield.text = itemToEdit?.name
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        itemToEdit = nil
    }
    
    func navConfig() {
        //Add titles and buttons to the NavigationBar, and modify the style of the NavigationBar.
        navigationItem.title = itemToEdit == nil ? "Add Item" : "Edit Item"
        navigationController?.navigationBar.tintColor = .orange
        navigationItem.setLeftBarButton(UIBarButtonItem(systemItem: .cancel), animated: true)
        navigationItem.setRightBarButton(UIBarButtonItem(systemItem: .done), animated: true)
        navigationController?.navigationBar.isTranslucent = true
        //Add binding event.
        let backBtn = navigationItem.leftBarButtonItem
        let doneBtn = navigationItem.rightBarButtonItem
        backBtn?.target = self
        backBtn?.action = #selector(backButtonClicked)
        doneBtn?.target = self
        doneBtn?.action = #selector(doneButtonClicked)
    }
    
    @objc func backButtonClicked() {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @objc func doneButtonClicked() {
        if let text = textfield.text, text != ""{
            if itemToEdit == nil {
                delegate?.addItemViewController(self, didfinishAdding: CheckListItem(name: text))
            } else {
                delegate?.addItemViewController(self, didfinishEditing: itemToEdit!, newName: text)
            }
        }
    }
    
    func makeItemTextField() -> UITextField {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Please enter a to-do list"
        textField.textColor = .systemPink
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.clearButtonMode = .whileEditing
        return textField
    }
}

extension ItemDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
