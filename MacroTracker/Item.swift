//
//  Item.swift
//  MacroTracker
//
//  Created by Alan Yanovich on 2024-04-25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
