//  ChatViewController.swift
//  Flash Chat iOS13

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!

    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        navigationItem.hidesBackButton = true
        navigationItem.title = K.appName
    }
    
    //MARK: - What happens after the send button is pressed

    @IBAction func sendPressed(_ sender: UIButton) {
        
    }
    
    //MARK: - Action after logout is pressed(Navigation item)

    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
    }
    
}

//MARK: - table view

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.textLabel?.text = messages[indexPath.row].body
        return cell
    }
}
