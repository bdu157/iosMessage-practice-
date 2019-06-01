//
//  MessageThread.swift
//  iosMessage(practice)
//
//  Created by Dongwoo Pae on 5/31/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import Foundation

class MessageThread: Codable {
    let title: String
    let identifier: String
    var messages: [MessageThread.Message]
    
    static func ==(lhs: MessageThread, rhs: MessageThread) -> Bool {
        return lhs.title == rhs.title &&
            lhs.identifier == rhs.identifier &&
            lhs.messages == rhs.messages
    }
    
    
    
    init(title: String, identifier: String = UUID().uuidString, messages: [MessageThread.Message] = []) {
        self.title = title
        self.identifier = identifier
        self.messages = messages
    }
    

    
    struct Message: Codable, Equatable {
        let text: String
        let sender: String
        let timestamp: Date
        
        init(text: String, sender: String, timestamp: Date = Date()) {
            self.text = text
            self.sender = sender
            self.timestamp = timestamp
        }
    }
    
    
    func createMessage(messageThread: MessageThread, text:String, sender:String, completion:@escaping (Error?) -> Void) {
        let messagess = MessageThread.Message(text: text, sender: sender)
        
        let createURL = MessageThreadController.baseURL.appendingPathComponent(messageThread.identifier).appendingPathComponent("messages").appendingPathExtension("json")
        
        var urlRequest = URLRequest(url: createURL)
        urlRequest.httpMethod = "POST"

        let jsonEncoder = JSONEncoder()
        
        do {
            urlRequest.httpBody = try jsonEncoder.encode(messagess)
            
            completion(nil)
        } catch {
            print(error)
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (_, _, error) in
            if let error = error {
                print(error)
                completion(nil)
                return
            }
            
            messageThread.messages.append(messagess)
            
        }
        
        
    }
    
}
