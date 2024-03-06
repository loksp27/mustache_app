//
//  Recording.swift
//  elevate
//
//  Created by Loksubhash Pulivarthi on 3/5/24.
//

import Foundation
struct Recording: Identifiable {
    let id: UUID = UUID()
    let videoPath: String
    let duration: Double
    let tag: String
}
