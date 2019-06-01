//
//  MessageThreadsTableViewController.swift
//  iosMessage(practice)
//
//  Created by Dongwoo Pae on 5/31/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

class MessageThreadsTableViewController: UITableViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    var messageThreadController: MessageThreadController = MessageThreadController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messageThreadController.messageThreads.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let title = messageThreadController.messageThreads[indexPath.row]
        cell.textLabel?.text = title.title
        return cell
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToMTDetailTableVC" {
            guard let destVC = segue.destination as? MessageThreadDetailTableViewController,
                let selectedRow = tableView.indexPathForSelectedRow else {return}
                destVC.messageThreadController = self.messageThreadController
                destVC.messageThread = messageThreadController.messageThreads[selectedRow.row]
        }
    }

    @IBAction func textFieldAction(_ sender: Any) {
        guard let text = textField.text else {return}
        self.messageThreadController.createMessageThread(title: text) { (error) in
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            
            
        }
    }
    
    
}
