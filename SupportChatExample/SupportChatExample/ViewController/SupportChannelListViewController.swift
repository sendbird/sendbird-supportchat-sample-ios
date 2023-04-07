//
//  SupportChannelListViewController.swift
//  SupportChatExample
//
//  Created by Jaesung Lee on 2023/03/30.
//

import UIKit
import SendbirdUIKit
import SendbirdChatSDK

class SupportChannelListViewController: SBUGroupChannelListViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let headerComponent = headerComponent {
            headerComponent.rightBarButton = UIBarButtonItem(
                title: "Start chat",
                style: .plain,
                target: headerComponent,
                action: #selector(headerComponent.onTapRightBarButton)
            )
        }
    }
    override func baseChannelListModule(_ headerComponent: SBUBaseChannelListModule.Header, didTapRightItem rightItem: UIBarButtonItem) {
        let params = GroupChannelCreateParams()
        params.name = ""
        params.coverURL = ""
        params.isDistinct = false
        params.isSuper = false
        params.isBroadcast = false
        
        if let currentUser = SBUGlobals.currentUser {
            params.addUserIds([currentUser.userId])
        }
        
        GroupChannel.createChannel(params: params) { [weak self] channel, error in
            guard let self, let groupChannel = channel else { return }
            SBULoading.start()
            Task {
                try await self.updateToSupportChatChannel(groupChannel)
                DispatchQueue.main.async {
                    SBULoading.stop()
                    SendbirdUI.moveToChannel(
                        channelURL: groupChannel.channelURL,
                        messageListParams: nil
                    )
                }
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
