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
            let accessoryType = cell.accessoryType
            cell.accessoryType = accessoryType == .none ? .checkmark : .none
        }
        checkListItems[indexPath.row].checked.toggle()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        checkListsTableView.beginUpdates()
        checkListItems.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        checkListsTableView.endUpdates()
    }
    
}

extension CheckListsVC: AddItemDelegate {
    func addItemComplete(item: String) {
        checkListItems.append(CheckListItem(name: item))
        checkListsTableView.reloadData()
    }
}
