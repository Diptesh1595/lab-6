//
//  CarsViewController.swift
//  lab 6
//
//  Created by user252703 on 7/6/24.
//

import UIKit

class CarsViewController: UITableViewCell {
    

    class CarsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
        @IBOutlet weak var tableView: UITableView!
        
        var carsData = [
            Car(make: "Audi", model: "Audi RS5", imageName: "car1"),
            Car(make: "Bmw", model: "Bmw X7", imageName: "car2"),
    
        ]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.delegate = self
            tableView.dataSource = self
        }
        
        // MARK: - Table View Data Source
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return carsData.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath)
            
            let car = carsData[indexPath.row]
            cell.textLabel?.text = "\(car.make) \(car.model)"
            cell.imageView?.image = UIImage(named: car.imageName)
            
            return cell
        }
        
        // MARK: - Table View Delegate
        
        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                carsData.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        
        // MARK: - Actions
        
        @IBAction func addCar(_ sender: UIBarButtonItem) {
            // Implement code to show an alert for adding a new car
            // Example:
            let alert = UIAlertController(title: "Add Car", message: "Enter details", preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.placeholder = "Make"
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Model"
            }
            alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self, weak alert] (_) in
                guard let self = self else { return }
                if let make = alert?.textFields?[0].text, let model = alert?.textFields?[1].text {
                    let newCar = Car(make: make, model: model, imageName: "defaultCarImage")
                    self.carsData.append(newCar)
                    self.tableView.reloadData()
                }
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        @IBAction func toggleEditMode(_ sender: UISwitch) {
            tableView.isEditing = sender.isOn
        }
        
    }

    struct Car {
        let make: String
        let model: String
        let imageName: String // Name of the image in your asset catalog
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
