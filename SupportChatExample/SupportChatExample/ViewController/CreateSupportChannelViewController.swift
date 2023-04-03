//
//  CreateSupportChannelViewController.swift
//  SupportChatExample
//
//  Created by Jaesung Lee on 2023/03/30.
//

import UIKit
import Combine
import SendbirdUIKit
import SendbirdChatSDK

class CreateSupportChannelViewController: SBUCreateChannelViewController {
    /// Refer to `SBUGlobalCustomParams.groupChannelParamsCreateBuilder`
    override func createChannelViewModel(_ viewModel: SBUCreateChannelViewModel, didCreateChannel channel: BaseChannel?, withMessageListParams messageListParams: MessageListParams?) {
        guard let groupChannel = channel as? GroupChannel else { return }
        SBULoading.start()
        Task {
            try await self.updateToSupportChatChannel(groupChannel)
            DispatchQueue.main.async {
                SBULoading.stop()
                SendbirdUI.moveToChannel(
                    channelURL: groupChannel.channelURL,
                    messageListParams: messageListParams
                )                
            }
        }
    }
    
    func updateToSupportChatChannel(_ channel: GroupChannel) async throws {
        guard let currentUser = SBUGlobals.currentUser else { return }
        
        let isEinsteinBotCase = channel.members.contains { $0.userId == "einstein-bot" }
        let request = CreateSupportChatRequest(
            subject: channel.name,
            suppliedName:  currentUser.refinedNickname(),
            sendbirdUserId: currentUser.userId,
            sendbirdChannelURL: channel.channelURL,
            isEinsteinBotCase: isEinsteinBotCase
        )
            .urlRequest
        
        let (_, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw SupportChatError.failedToCreateSupportChat
        }
        return
    }
}
