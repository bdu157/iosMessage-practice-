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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

    @IBAction func textFieldAction(_ sender: Any) {
    }
    
    
}
