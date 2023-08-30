//
//  Message.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 30.08.2023.
//

import Foundation

struct Message {
    enum Sender {
        case me, you
    }
    
    let sender: Sender
    let body: String
}
 
extension Message {
    static func getMassage() -> [Message] {
        return [
            Message(sender: .me , body: "What is the capital of France?"),
            Message(sender: .me , body: "What is the capital of France?"),
            Message(sender: .me , body: "What is the capital of France?"),
            Message(sender: .me , body: "What is the capital of France?"),
        ]
    }
}
