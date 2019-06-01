//
//  MessageDetailViewController.swift
//  iosMessage(practice)
//
//  Created by Dongwoo Pae on 5/31/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

class MessageDetailViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func sendButtonTapped(_ sender: Any) {
        
    }
}
