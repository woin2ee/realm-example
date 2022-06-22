//
//  DetailViewController.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/19.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var edtTitle: UITextView!
    @IBOutlet private weak var edtDetail: UITextView!
    @IBOutlet private weak var btnImportance: UIButton!
    @IBOutlet private weak var lblDate: UILabel!
    
    private var viewModel: DetailViewModel
    
    required init?(coder: NSCoder) {
        self.viewModel = DefaultDetailViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.todoItem.bind { [weak self] item in self?.setupView(item: item) }
    }
    
    func bind(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Private Method
    
    @IBAction private func clickCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func clickSaveButton(_ sender: Any) {
        
    }
    
    private func setupView(item: TodoItemDTO) {
        edtTitle.text = item.title
        edtDetail.text = item.detail
        btnImportance.setTitle(item.importance, for: .normal)
        lblDate.text = item.date
    }
}
