//
//  ResponseModels.swift
//  MacroTracker
//
//  Created by Alan Yanovich on 2024-04-26.
//

import Foundation

struct GPTResponse: Decodable {
    let choices: [GPTCompletion]
}

struct GPTCompletion: Decodable {
    let message: GPTResponseMessage

}

struct GPTResponseMessage: Decodable {
    let toolCall: [GPTToolCall]
    
    enum CodingKeys: String, CodingKey {
        case toolCall = "tool_calls"
    }
}

struct GPTToolCall: Decodable {
    let function: GPTFunctionCall?
}


struct GPTFunctionCall: Decodable {
    let name: String
    let arguments: String
}

struct MacroResult: Decodable {
    let food: String
    let fats: Int
    let protein: Int
    let carbs: Int
    
}
