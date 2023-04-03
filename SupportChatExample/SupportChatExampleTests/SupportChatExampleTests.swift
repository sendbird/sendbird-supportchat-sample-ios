//
//  SupportChatExampleTests.swift
//  SupportChatExampleTests
//
//  Created by Jaesung Lee on 2023/03/30.
//

import XCTest
import SendbirdChatSDK
@testable import SupportChatExample

final class SupportChatExampleTests: XCTestCase {

    enum TestError: Error, CustomStringConvertible {
        case noRequestBody
        case failedToGetDictionaryFromJSON
        
        var description: String {
            switch self {
            case .noRequestBody:
                return "No request body"
            case .failedToGetDictionaryFromJSON:
                return "Failed to get dictionary from json object"
            }
        }
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_createSupportChatChannel() throws {
        let request = CreateSupportChatRequest(
            subject: "channel_name",
            suppliedName: "j_sung_0o0",
            sendbirdUserId: "j_sung_0o0",
            sendbirdChannelURL: "sendbird_group_channel_249310761_9905484610e20f051120f2601488ab6702d615c5",
            isEinsteinBotCase: false
        )
        let urlRequest = request.urlRequest
        guard let data = urlRequest.httpBody else {
            throw TestError.noRequestBody
        }
        let jsonObject = try JSONSerialization.jsonObject(with: data)
        guard let dict = jsonObject as? [String: Any] else {
            throw TestError.failedToGetDictionaryFromJSON
        }
        XCTAssertEqual(dict["suppliedName"] as? String, "j_sung_0o0")
        XCTAssertEqual(dict["sendbirdUserId"] as? String, "j_sung_0o0")
        XCTAssertEqual(dict["subject"] as? String, "channel_name")
        XCTAssertEqual(dict["sendbirdChannelURL"] as? String, "sendbird_group_channel_249310761_9905484610e20f051120f2601488ab6702d615c5")
        XCTAssertEqual(dict["isEinsteinBotCase"] as? Bool, false)
    }

}
