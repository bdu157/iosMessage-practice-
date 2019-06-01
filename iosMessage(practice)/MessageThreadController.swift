//
//  MessageThreadController.swift
//  iosMessage(practice)
//
//  Created by Dongwoo Pae on 5/31/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case put = "PUT"
    case post = "POST"
}


class MessageThreadController {
    
    var messageThreads: [MessageThread] = []
    
    static let baseURL = URL(string: "https://message-board-b0673.firebaseio.com/")!
    
    func createMessageThread(title: String, completion:@escaping (Error?)-> Void) {
        let messageThread  = MessageThread.init(title: "title")
        
        let createMURL = MessageThreadController.baseURL.appendingPathComponent(messageThread.identifier).appendingPathExtension("json")
        
        var request = URLRequest(url: createMURL)
        request.httpMethod = HTTPMethod.put.rawValue
        
        do {
            request.httpBody = try JSONEncoder().encode(messageThread)
            completion(nil)
        } catch {
            print(error)
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (_, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            self.messageThreads.append(messageThread)
            completion(nil)
        }.resume()
    }
    
    
    
    
    
    
    
    
    
    
}
