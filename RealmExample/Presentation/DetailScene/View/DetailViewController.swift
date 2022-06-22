//
//  DetailViewController.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/19.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var edtTitle: UITextView! {
        didSet {
            edtTitle.delegate = self
        }
    }
    @IBOutlet weak var edtTitleBackground: UITextField!
    @IBOutlet private weak var edtDetail: UITextView! {
        didSet {
            edtDetail.delegate = self
        }
    }
    @IBOutlet weak var edtDetailBackground: UITextField!
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
        initTextViews()
    }
    
    func bind(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    func initTextViews() {
        if viewModel.todoItem.value.title.isEmpty {
            showTitlePlaceholder()
        } else {
            hideTitlePlaceholder()
        }
        if viewModel.todoItem.value.detail.isEmpty {
            showDetailPlaceholder()
        } else {
            hideDetailPlaceholder()
        }
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
    
    private func showTitlePlaceholder() {
        edtTitleBackground.isHidden = false
    }
    
    private func hideTitlePlaceholder() {
        edtTitleBackground.isHidden = true
    }
    
    private func showDetailPlaceholder() {
        edtDetailBackground.isHidden = false
    }
    
    private func hideDetailPlaceholder() {
        edtDetailBackground.isHidden = true
    }
}

// MARK: - UITextViewDelegate

extension DetailViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        switch textView.tag {
        case 0:
            if textView.text.isEmpty {
                hideTitlePlaceholder()
            }
        case 1:
            if textView.text.isEmpty {
                hideDetailPlaceholder()
            }
        default:
            return false
        }
        
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        switch textView.tag {
        case 0:
            if textView.text.isEmpty {
                showTitlePlaceholder()
            }
        case 1:
            if textView.text.isEmpty {
                showDetailPlaceholder()
            }
        default:
            return
        }
    }
}
