//
//  MainViewController.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/18.
//

import UIKit

final class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let nc = storyboard.instantiateViewController(withIdentifier: "DetailNavigationController") as! UINavigationController
        present(nc, animated: true) {
            let vc = nc.viewControllers.first as! DetailViewController
            vc.setupView(item: TodoItemDTO.createEmpty())
        }
    }
}
