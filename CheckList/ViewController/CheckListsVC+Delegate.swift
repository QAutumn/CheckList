//
//  CheckListsVC+Delegate.swift
//  CheckList
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
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
