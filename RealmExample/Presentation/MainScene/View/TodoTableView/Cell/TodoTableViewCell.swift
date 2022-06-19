//
//  TodoTableViewCell.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/19.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    @IBOutlet private weak var lblDate: UILabel!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblImportance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fill(todoItem: TodoItemDTO) {
        lblDate.text = todoItem.date
        lblTitle.text = todoItem.title
        lblImportance.text = todoItem.importance
    }
}
