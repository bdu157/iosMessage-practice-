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
    
    var messageThread: MessageThread?
    var messageThreadController: MessageThreadController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "New Messages"
        // Do any additional setup after loading the view.
    }

    @IBAction func sendButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
           let message = messageTextView.text,
            let messageThread = messageThread else {return}
        self.messageThread?.createMessage(messageThread: messageThread, text: message, sender: name, completion: { (error) in
            if let error = error {
                print(error)
                return
            }
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
            
        })
    }
}
