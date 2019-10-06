//
//  ViewController.swift
//  swiftTextile
//
//  Created by Jaeson Booker on 9/28/19.
//  Copyright © 2019 Jaeson Booker. All rights reserved.
//

import UIKit
//import Pods_swiftTextile
import Textile
class ViewController: UIViewController {
    @IBAction func buttonTime(_ sender: Any) {
//        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//        let repoPath = (documentsPath as NSString).appendingPathComponent("textile-repo")
//
//        if(!Textile.isInitialized(repoPath)) {
//          var error: NSError?
//          let recoveryPhrase = Textile.initializeCreatingNewWalletAndAccount(repoPath, debug: false, logToDisk: false, error: &error)
//          // Return phrase to the user for secure, out of app, storage
//        }
//
//        do {
//          try Textile.launch(repoPath, debug: false)
//        } catch {
//          // handle launch error
//        }

        // Set the Textile delegate to self so we can make use of events such nodeStarted
//        Textile.instance().delegate = self as! TextileDelegate
        var error: NSError?
        let profile = Textile.instance().profile.get(&error)
        if (error != nil) {
          print(error)
        } else {
          print(profile)
        }
        Textile.instance().profile.setName("Clyde", error: &error)
        if (error != nil) {
          print(error)
        } else {
          print("success")
        }
        let adress = Textile.instance().account.address()
        let seed = Textile.instance().account.seed()
        print("address")
        print(adress)
        print("seed")
        print(seed)
        let name = Textile.instance().profile.name(&error)
        if (error != nil) {
          print(error)
        } else {
          print(name)
        }
        let options = QueryOptions()
        Textile.instance().account.sync(options, error: &error)
        if (error != nil) {
          print(error)
        } else {
          print("success")
        }
        let schema = AddThreadConfig_Schema()
        let jsonData = "{ number: 666, anotherNumber: 42 }".data(using: .utf8)
//        schema.preset = AddThreadConfig_Schema_Preset.test
//        schema.json = jsonData
        if let data = jsonData {
          let dataString = data.base64EncodedString()
            schema.json = dataString
        }
        let config = AddThreadConfig()
        config.key = "com.jaeson.textile.swiftTextile.13.Chat3"
        config.name = "Chat3"
        config.type = Thread_Type.open
        config.sharing = Thread_Sharing.shared
        config.whitelistArray = ["P7X3gZus5H15tWCxk4oP6EVsgAM9vwUfCyepAKw49QuRyPYs"]
        config.schema = schema
        let thread = Textile.instance().threads.add(config, error: &error)
        if (error != nil) {
          print(error)
        } else {
          print("success")
          print(thread)
        }
        let threads = Textile.instance().threads
        print(threads)
//        Textile.instance().invites.addExternal("<thread-id>", error: &error)
//    Textile.instance().invites.add("12D3KooWBfdhD4tNMuTn5MHGof2bMZBKAUjFF3DBL3kuQQE5m1qw", address: "P7X3gZus5H15tWCxk4oP6EVsgAM9vwUfCyepAKw49QuRyPYs", error: &error)
//        Textile.instance().comments.add("QmUvWjstQzR6y7UctRJgVjcKsKzutZoiBsQw6WBXMnmg84", body: "Is this an outlier?", error: &error)
        //12D3KooWN3cU8pCx8xPyskgJbDgANWt6BgKMoi5d9osn184DzpyA
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        let schema = AddThreadConfig_Schema()
//        schema.preset = AddThreadConfig_Schema_Preset.blob
//        let config = AddThreadConfig()
//        config.key = "com.jaeson.textile.swiftTextile"
//        config.name = "Any old data"
//        config.type = Thread_Type.private
//        config.sharing = Thread_Sharing.notShared
//        config.schema = schema
//        let thread = Textile.instance().threads.add(config, error: &error)
//        if (error != nil) {
//          // Do something with this error
//        } else {
//          // Success!
//        }
//        let request = FeedRequest()
//        request.thread = ""
//        var _: NSError?
//        let feedItemList = Textile.instance().feed.list(request, error: &error)
//        if (error != nil) {
//          // Do something with this error
//        } else {
//          // Success!
//        }
//        var _: NSError?
//        let schema = AddThreadConfig_Schema()
//        schema.preset = AddThreadConfig_Schema_Preset.blob
//        let config = AddThreadConfig()
//        config.key = "com.jaeson.textile.swiftTextile"
//        config.name = "Basic"
//        config.type = Thread_Type.private
//        config.sharing = Thread_Sharing.notShared
//        config.schema = schema
//        let thread = Textile.instance().threads.add(config, error: &error)
//        if (error != nil) {
//          // Do something with this error
//        } else {
//          // Success!
//        }
//        var _: NSError?
//        Textile.instance().profile.setName("Name", error: &error)
//        if (error != nil) {
//          // Do something with this error
//        } else {
//          // Success!
//        }
//        var error3: NSError?
//        let profile = Textile.instance().profile.get(&error3)
//        if (error3 != nil) {
//          print(error3)
//        } else {
//          print(profile)
//        }
//        let address1 = Textile.instance().account.address()
//        let seed = Textile.instance().account.seed()
//        print(address1)
//        print(seed)
//        var _: NSError?
//        Textile.instance().messages.add("<thread-id>", body: "yo, yo", error: &error)
//        if (error != nil) {
//          // Do something with this error
//        } else {
//          // Success!
//        }
//        let threadId = "<thread-id>"
//        let jsonData = "{ latitude: 48.858093, longitude: 2.294694 }".data(using: .utf8)
//        if let data = jsonData {
//          let dataString = data.base64EncodedString()
//          Textile.instance().files.prepare(dataString, threadId: threadId) { (preparedFiles, error) in
//            if let files = preparedFiles {
//              var filesAddError: NSError?
//              Textile.instance().files.add(files.dir, threadId: threadId, caption: nil, error: &filesAddError)
//              if (filesAddError != nil) {
//                // Do something with this error
//              } else {
//                // Success!
//              }
//            } else {
//              // Do something with error
//            }
//          }
//        }
//        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//        let repoPath = (documentsPath as NSString).appendingPathComponent("textile-repo")
//
//        if(!Textile.isInitialized(repoPath)) {
//          var error: NSError?
//          let recoveryPhrase = Textile.initializeCreatingNewWalletAndAccount(repoPath, debug: false, logToDisk: false, error: &error)
//          // Return phrase to the user for secure, out of app, storage
//        }
//
//        do {
//          try Textile.launch(repoPath, debug: false)
//        } catch {
//          // handle launch error
//        }
//
//        // Set the Textile delegate to self so we can make use of events such nodeStarted
//        Textile.instance().delegate = self
        
    }


}

