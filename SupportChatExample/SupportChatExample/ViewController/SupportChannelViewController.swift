//
//  SupportChannelViewController.swift
//  SupportChatExample
//
//  Created by Jaesung Lee on 2023/03/30.
//

import UIKit
import SendbirdUIKit
import SendbirdChatSDK

class SupportChannelModuleList: SBUGroupChannelModule.List {
    override func createMessageMenuItems(for message: BaseMessage) -> [SBUMenuItem] {
        let isSentByMe = message.sender?.userId == SBUGlobals.currentUser?.userId
        var items: [SBUMenuItem] = []
        
        switch message {
        case is UserMessage:
            let copy = self.createCopyMenuItem(for: message)
            items.append(copy)
            if isSentByMe {
                let edit = self.createEditMenuItem(for: message)
                items.append(edit)
            }
        case let fileMessage as FileMessage:
            let save = self.createSaveMenuItem(for: message)
            if SBUUtils.getFileType(by: fileMessage) != .voice {
                items.append(save)
            }
        default:
            break
        }
        return items
    }
}

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
