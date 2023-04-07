//
//  SupportChannelUserListViewController.swift
//  SupportChatExample
//
//  Created by Aaron Ha on 2023/04/07.
//

import Foundation

import UIKit
import SendbirdUIKit

class SupportChannelUserListModuleList: SBUUserListModule.List {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        (cell as? SBUUserCell)?.moreButton.isHidden = true
        return cell
    }
}

class SupportChannelUserListViewController: SBUUserListViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        headerComponent?.rightBarButton = nil
    }
}
