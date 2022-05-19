//
//  CheckListsVC+Delegate.swift
//  CheckList
//
//  Created by 澈水 on 2022/5/18.
//

import Foundation
import UIKit

extension CheckListsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { checklistItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let checklistItem = checklistItems[indexPath.row]
        //update text and checkMark of cell
        updateText(for: cell, with: checklistItem)
        updateCheckMark(for: cell, with: checklistItem)
        return cell
    }
    
    func updateText(for cell: UITableViewCell, with item: ChecklistItem) {
        //Set the mostleft picture and text of the cell
        var cfg = UIListContentConfiguration.cell()
        cfg.image = UIImage(systemName: "sun.min")
        cfg.text = item.name
        cell.contentConfiguration = cfg
    }
    
    func updateCheckMark(for cell: UITableViewCell, with item: ChecklistItem) {
        cell.accessoryType = item.checked ? .checkmark : .none
    }
}
