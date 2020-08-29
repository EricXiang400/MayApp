//
//  ConversationModels.swift
//  MayApp1
//
//  Created by Eric Xiang on 7/31/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation

struct Conversation {
    let id: String
    let name: String
    let otherUserEmail: String
    let latestMessage: LatestMessage
}

struct LatestMessage {
    let date: String
    let text: String
    let isRead: Bool
}
