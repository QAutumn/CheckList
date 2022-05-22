//
//  checkListsVC+Delegate.swift
//  checkList
//
//  Created by 澈水 on 2022/5/18.
//

import Foundation
import UIKit

extension CheckListsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { checkListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let checkListItem = checkListItems[indexPath.row]
        //update text and checkMark of cell
        updateText(for: cell, with: checkListItem)
        updateCheckMark(for: cell, with: checkListItem)
        return cell
    }
    
    func updateText(for cell: UITableViewCell, with item: CheckListItem) {
        //Set the mostleft picture and text of the cell
        var config = cell.defaultContentConfiguration()
        if item.checked {
            config.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            config.image = UIImage(systemName: "checkmark.circle")
        }
        config.imageProperties.tintColor = .orange
        config.text = item.name
        cell.contentConfiguration = config

    }
    
    func updateCheckMark(for cell: UITableViewCell, with item: CheckListItem) {
        cell.accessoryType = .detailDisclosureButton
    }
}
