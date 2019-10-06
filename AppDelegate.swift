//
//  AppDelegate.swift
//  swiftTextile
//
//  Created by Jaeson Booker on 9/28/19.
//  Copyright © 2019 Jaeson Booker. All rights reserved.
//

import UIKit
import Pods_swiftTextile
import Textile
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Early on in the app lifecycle, usually in AppDelegate
        // Initialize a new Textile wallet for the user.
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let repoPath = (documentsPath as NSString).appendingPathComponent("textile-repo")

        if(!Textile.isInitialized(repoPath)) {
          var error: NSError?
          let recoveryPhrase = Textile.initializeCreatingNewWalletAndAccount(repoPath, debug: false, logToDisk: false, error: &error)
          // Return phrase to the user for secure, out of app, storage
        }

        do {
          try Textile.launch(repoPath, debug: false)
        } catch {
          // handle launch error
        }

        // Set the Textile delegate to self so we can make use of events such nodeStarted
//        Textile.instance().delegate = self as! TextileDelegate
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

