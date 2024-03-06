//
//  Item.swift
//  elevate
//
//  Created by Loksubhash Pulivarthi on 3/5/24.
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
