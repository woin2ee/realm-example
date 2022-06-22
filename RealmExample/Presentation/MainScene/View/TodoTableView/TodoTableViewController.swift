//
//  TodoTableViewController.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/18.
//

import UIKit

final class TodoTableViewController: UITableViewController {
    
    private var viewModel: MainViewModel
    
    required init?(coder: NSCoder) {
        self.viewModel = DefaultMainViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.todoList.bind { [weak self] _ in self?.reloadTable() }
    }
    
    private func reloadTable() {
        tableView.reloadData()
        print("reload")
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension TodoTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todoList.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell") as! TodoTableViewCell
        cell.fill(todoItem: viewModel.todoList.value[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let nc = storyboard.instantiateViewController(withIdentifier: "DetailNavigationController") as! UINavigationController
        let vc = nc.viewControllers.first as! DetailViewController
        vc.bind(viewModel: DefaultDetailViewModel(todoItem: .init(viewModel.todoList.value[indexPath.row])))
        present(nc, animated: true)
    }
}
