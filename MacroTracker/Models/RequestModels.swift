//
//  RequestModels.swift
//  MacroTracker
//
//  Created by Alan Yanovich on 2024-04-26.
//

import Foundation


struct GPTChatPayload: Encodable {
    let model: String
    let messages: [GPTMessage]
    let tools: [GPTTools]
}

struct GPTMessage: Encodable {
    let role: String
    let content: String
}

struct GPTTools: Encodable {
    let type: String
    let function: GPTFunction
}

struct GPTFunction: Encodable {
    let name: String
    let description: String
    let parameters: GPTFunctionParam
}

struct GPTFunctionParam: Encodable {
    let type: String
    let properties: [String: GPTFunctionProperty]?
    let required: [String]?
}

struct GPTFunctionProperty: Encodable {
    let type: String
    let description: String
}
                     
