//
//  AppDelegate.swift
//  SupportChatExample
//
//  Created by Jaesung Lee on 2023/03/30.
//

import UIKit
import SendbirdUIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // TODO: App ID
        SendbirdUI.initialize(applicationId: "13B6D179-33A5-4C0D-9162-E11DAC9358FC") { error in
            //
        }
        
        SBUGlobals.currentUser = SBUUser(userId: "j_sung_0o0")
        
        /// Or override `SBUCreateChannelViewModel/createChannel`
        SBUGlobalCustomParams.groupChannelParamsCreateBuilder = { params in
            params?.customType = "SALESFORCE_SUPPORT_CHAT_CHANNEL"
        }
        
        SBUViewControllerSet.GroupChannelListViewController = SupportChannelListViewController.self
        SBUViewControllerSet.CreateChannelViewController = CreateSupportChannelViewController.self
        SBUViewControllerSet.GroupChannelViewController = SupportChannelViewController.self
        SBUViewControllerSet.GroupChannelSettingsViewController = SupportChannelSettingsViewController.self
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = SBUViewControllerSet.GroupChannelListViewController.init()
        let navigationController = UINavigationController.init(rootViewController: viewController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        application.applicationIconBadgeNumber = 0
    }
}

