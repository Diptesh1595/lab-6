import UIKit

class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Sample data for friends
    var friendsData = [
        ("Santosh", "sant@email.com", "345-567-7890", "friend1", "friend2", "friend3"),
        ("Rohit", "roh@email.com", "345-452-5643", "friend4", "friend5", "friend6"),
        // Add more sample data as needed
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up table view
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // Assuming all friends are in one section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendTableViewCell
        
        let (name, email, phone, image1, image2, image3) = friendsData[indexPath.row]
        cell.nameLabel.text = name
        cell.emailLabel.text = email
        cell.phoneLabel.text = phone
        cell.imageView1.image = UIImage(named: image1)
        cell.imageView2.image = UIImage(named: image2)
        cell.imageView3.image = UIImage(named: image3)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection if needed
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            friendsData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func addFriendTapped(_ sender: Any) {
        // Implement adding a new friend functionality (navigate to input screen or show an alert)
        // Example: Show an alert
        let alert = UIAlertController(title: "Add Friend", message: "Enter friend details", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Email"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Phone"
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak self] (_) in
            guard let self = self else { return }
            
            if let name = alert.textFields?[0].text,
               let email = alert.textFields?[1].text,
               let phone = alert.textFields?[2].text {
                
                // Add the new friend to the data source
                self.friendsData.append((name, email, phone, "defaultImage1", "defaultImage2", "defaultImage3")) // Replace with actual default image names
                self.tableView.reloadData()
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

