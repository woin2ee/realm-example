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
    
    func setCell(date: Date?, title: String, importance: Importance) {
        if let date = date {
            lblDate.text = dateFormatter.string(from: date)
        } else {
            lblDate.text = "날짜 없음"
        }
        
        lblTitle.text = title
        lblImportance.text = importance.rawValue
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yy/MM/dd"
    return formatter
}()
