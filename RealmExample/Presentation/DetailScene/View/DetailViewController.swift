//
//  DetailViewController.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/19.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet private weak var lblDate: UILabel!
    @IBOutlet private weak var lblImportance: UILabel!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupView(item: TodoItemDTO) {
        lblDate.text = item.date
        lblImportance.text = item.importance
        lblTitle.text = item.title
        lblDetail.text = item.detail
    }
}
