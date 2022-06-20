//
//  DetailViewController.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/19.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var edtTitle: UITextView!
    @IBOutlet weak var edtDetail: UITextView!
    @IBOutlet weak var btnImportance: UIButton!
    @IBOutlet weak var lblDate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupView(item: TodoItemDTO) {
        edtTitle.text = item.title
        edtDetail.text = item.detail
        btnImportance.setTitle(item.importance, for: .normal)
        lblDate.text = item.date
    }
}
