//
//  SupportChannelListViewController.swift
//  SupportChatExample
//
//  Created by Jaesung Lee on 2023/03/30.
//

import UIKit
import SendbirdUIKit

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
        self.showCreateChannel(type: .group)
    }
}
