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
        viewModel.todoList.bind { [weak self] _ in self?.tableView.reloadData() }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension TodoTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todoList.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell") as! TodoTableViewCell
        
        cell.setCell(
            date: viewModel.todoList.value[indexPath.row].date,
            title: viewModel.todoList.value[indexPath.row].title,
            importance: viewModel.todoList.value[indexPath.row].importanceEnum
        )
        
        return cell
    }
}
