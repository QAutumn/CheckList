//
//  checkListsVC+Delegate.swift
//  checkList
//
//  Created by 澈水 on 2022/5/18.
//

import Foundation
import UIKit

extension CheckListsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let checked = checkListItems[indexPath.row].checked
            var config = cell.contentConfiguration as! UIListContentConfiguration
            config.image = checked ? UIImage(systemName: "checkmark.circle") : UIImage(systemName: "checkmark.circle.fill")
            cell.contentConfiguration = config
            checkListItems[indexPath.row].checked.toggle()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        checkListTableView.beginUpdates()
        checkListItems.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        checkListTableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        addItemVC.itemToEdit = checkListItems[indexPath.row]
        navigationController?.pushViewController(addItemVC, animated: true)
    }
}

extension CheckListsVC: ItemDetailViewControllerDelegate {
    func addItemViewControllerDidCancel(_ controller: ItemDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: ItemDetailViewController, didfinishAdding item: CheckListItem) {
        checkListItems.append(item)
        checkListTableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: ItemDetailViewController, didfinishEditing item: CheckListItem, newName name: String) {
        if let index = checkListItems.firstIndex(where: { $0.name == item.name }) {
            let indexPath = IndexPath(row: index, section: 0)
            let cell = checkListTableView.cellForRow(at: indexPath)!
            var item = item
            item.name = name
            updateText(for: cell, with: item)
        }
        navigationController?.popViewController(animated: true)
    }
   

}

extension CheckListsVC {
    @objc func addcheckListBtnClicked () {
        navigationController?.pushViewController(addItemVC, animated: true)
    }
}
