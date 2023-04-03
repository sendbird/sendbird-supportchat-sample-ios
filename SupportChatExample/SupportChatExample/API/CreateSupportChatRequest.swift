//
//  SupportChatModel.swift
//  SupportChatExample
//
//  Created by Jaesung Lee on 2023/03/30.
//

import Combine
import Foundation
/**
 ```json
 (POST) https://sendbird11-dev-ed.develop.my.salesforce-sites.com/services/apexrest/cases/
 {
     "subject": "Help needed!",
     "suppliedName": "Test Customer",
     "sendbirdUserId": "SENDBIRD_USER_ID",
     "sendbirdChannelURL": "SENDBIRD_GROUP_CHANNEL_ID",
     "isEinsteinBotCase": false
 }
 ```
 */
struct CreateSupportChatRequest: Encodable {
    let subject: String
    let suppliedName: String
    let sendbirdUserId: String
    let sendbirdChannelURL: String
    let isEinsteinBotCase: Bool
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: URL(string: "https://sendbird11-dev-ed.develop.my.salesforce-sites.com/services/apexrest/cases/")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(self)
        return request
    }
}

