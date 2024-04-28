//
//  Macro.swift
//  MacroTracker
//
//  Created by Alan Yanovich on 2024-04-26.
//

import Foundation
import SwiftData

@Model
final class Macro {
    let food: String
    let createdAt: Date
    let date: Date
    let fats: Int
    let carbs: Int
    let protein: Int
    
    init(food: String, createdAt: Date, date: Date, fats: Int, carbs: Int, protein: Int) {
        self.food = food
        self.createdAt = createdAt
        self.date = date
        self.fats = fats
        self.carbs = carbs
        self.protein = protein
    }
}
