//
//  SupportChatError.swift
//  SupportChatExample
//
//  Created by Jaesung Lee on 2023/03/30.
//

import Foundation

enum SupportChatError: Error, CustomStringConvertible {
    case failedToCreateSupportChat
    
    var description: String {
        switch self {
        case .failedToCreateSupportChat:
            return "Failed to create support chat channel"
        }
    }
}
