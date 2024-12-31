//
//  Item.swift
//  iTour
//
//  Created by Justin Hold on 12/31/24.
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
