//
//  SupportChannelSettingsViewController.swift
//  SupportChatExample
//
//  Created by Jaesung Lee on 2023/04/03.
//

import UIKit
import SendbirdUIKit

class SupportChannelSettingsViewController: SBUGroupChannelSettingsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerComponent?.rightBarButton = nil
    }
}

class SupportChannelSettingsModuleList: SBUGroupChannelSettingsModule.List {
    override func setupItems() {
        let notificationsItem = self.createNotificationItem()
        let membersItem = self.createMembersItem()
        let searchItem = self.createSearchItem()
        
        self.items = [notificationsItem, membersItem, searchItem]
    }
}
