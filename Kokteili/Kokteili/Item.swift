//
//  Item.swift
//  Kokteili
//
//  Created by Pedro Ramos on 25/01/25.
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
