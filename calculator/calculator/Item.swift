//
//  Item.swift
//  calculator
//
//  Created by Полина Лущевская on 27.02.24.
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
