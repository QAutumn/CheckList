//
//  AddItemViewController.swift
//  checkList
//
//  Created by 澈水 on 2022/5/20.
//

import UIKit
import SnapKit

protocol AddItemDelegate {
    func addItemComplete(item: String)
}

class AddItemViewController: UIViewController {
    
    lazy var itemTextField = makeItemTextField()
    var delegate: AddItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navConfig()
        view.backgroundColor = .white

        view.addSubview(itemTextField)
        itemTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(navigationController?.navigationBar.frame.maxY ?? 0)
        }
        
        itemTextField.becomeFirstResponder()
    }
    
    func navConfig() {
        //Add titles and buttons to the NavigationBar, and modify the style of the NavigationBar.
        navigationItem.title = "Add Item"
        navigationController?.navigationBar.tintColor = .orange
        navigationItem.setLeftBarButton(UIBarButtonItem(systemItem: .cancel), animated: true)
        navigationItem.setRightBarButton(UIBarButtonItem(systemItem: .done), animated: true)
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .white
        //Add binding event.
        let backBtn = navigationItem.leftBarButtonItem
        let doneBtn = navigationItem.rightBarButtonItem
        backBtn?.target = self
        backBtn?.action = #selector(backButtonClicked)
        
        doneBtn?.target = self
        doneBtn?.action = #selector(doneButtonClicked)
    }
    
    @objc func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonClicked() {
        delegate?.addItemComplete(item: itemTextField.text!)
        navigationController?.popViewController(animated: true)
    }
    
    func makeItemTextField() -> UITextField {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Please enter a to-do list"
        textField.textColor = .blue
        textField.font = UIFont.systemFont(ofSize: 30)
        textField.clearButtonMode = .whileEditing
        // Add button to textField
        textField.leftView = UIImageView(image: UIImage(systemName: "square.and.arrow.up"))
        textField.leftViewMode = .always
        textField.rightView = UIImageView(image: UIImage(systemName: "square.and.arrow.up"))
        textField.rightViewMode = .unlessEditing
        return textField
    }
}

extension AddItemViewController: UITextFieldDelegate {

    //Called when the textField is displayed
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("did end begin")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    /*
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // do something..
        return true
    }
     */
}
