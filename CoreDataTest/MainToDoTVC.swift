//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Damir Lutfullin on 30.06.2020.
//  Copyright © 2020 DamirLutfullin. All rights reserved.
//

import UIKit

class MainToDoTableVC: UITableViewController {
    
    var tasks = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        title = "ToDo list"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTask))

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    
    
    @objc private func addNewTask() {
        let alert = UIAlertController(title: "New task", message: "enter new task", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "save", style: .default) { [weak self ] action in
            if let text = alert.textFields?.first?.text {
                self?.tasks.insert(text, at: 0)
                self?.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
                alert.dismiss(animated: true, completion: nil)
            }
        }
        alert.addTextField(configurationHandler: nil)
        alert.addAction(saveAction)
        present(alert, animated: true, completion: nil)
    }
    

}

