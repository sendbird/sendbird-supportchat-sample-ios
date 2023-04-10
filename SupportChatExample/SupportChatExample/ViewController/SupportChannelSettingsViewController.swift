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

class SupportChannelPushSettingsModuleList: SBUGroupChannelPushSettingsModule.List {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // To hide toggle of `mention only` option
        return 1
    }
}

class SupportChannelSettingsModuleList: SBUGroupChannelSettingsModule.List {
    override func setupItems() {
        let notificationsItem = self.createNotificationItem()
        let membersItem = self.createMembersItem()
        self.items = [notificationsItem, membersItem]
    }
}
