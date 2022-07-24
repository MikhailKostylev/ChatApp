//
//  Message.swift
//  ChatApp
//
//  Created by Mikhail Kostylev on 19.07.2022.
//

import Foundation

enum MessageType: String {
    case sent
    case received
}

struct Message: Hashable {
    let text: String
    let type: MessageType
    let created: Date
}
