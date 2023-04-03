//
//  SupportChannelViewController.swift
//  SupportChatExample
//
//  Created by Jaesung Lee on 2023/03/30.
//

import UIKit
import SendbirdUIKit

class SupportChannelViewController: SBUGroupChannelViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func showChannelSettings() {
        guard let channel = self.channel else { return }
        
        let channelSettingsVC = SBUViewControllerSet.GroupChannelSettingsViewController.init(channel: channel)
        channelSettingsVC.listComponent = SupportChannelSettingsModuleList()
        self.navigationController?.pushViewController(channelSettingsVC, animated: true)
    }
}
