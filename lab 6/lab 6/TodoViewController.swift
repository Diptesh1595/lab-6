//
//  TodoViewController.swift
//  lab 6
//
//  Created by user252703 on 7/6/24.
//

import UIKit

class TodoViewController: UITableViewCell {


    class TodoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
        @IBOutlet weak var tableView: UITableView!
        
        var todoData = [
            TodoItem(category: "Work", task: "Working on topic"),
            TodoItem(category: "Personal", task: "Purchasing clothes"),
            // Add more todos as needed
        ]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.delegate = self
            tableView.dataSource = self
        }
        
        // MARK: - Table View Data Source
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return todoData.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
            
            let todo = todoData[indexPath.row]
            cell.textLabel?.text = "\(todo.category): \(todo.task)"
            
            return cell
        }
        
        // MARK: - Table View Delegate
        
        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                todoData.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        
        // MARK: - Actions
        
        @IBAction func addTodo(_ sender: UIBarButtonItem) {
            // Implement code to show an alert for adding a new todo
            // Example:
            let alert = UIAlertController(title: "Add Todo", message: "Enter details", preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.placeholder = "Category"
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Task"
            }
            alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self, weak alert] (_) in
                guard let self = self else { return }
                if let category = alert?.textFields?[0].text, let task = alert?.textFields?[1].text {
                    let newTodo = TodoItem(category: category, task: task)
                    self.todoData.append(newTodo)
                    self.tableView.reloadData()
                }
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }

    struct TodoItem {
        let category: String
        let task: String
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
