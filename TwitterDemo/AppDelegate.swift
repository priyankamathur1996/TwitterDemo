//
//  AppDelegate.swift
//  TwitterDemo
//
//  Created by call soft on 13/12/2019.
//  Copyright © 2019 call soft. All rights reserved.
//

import UIKit
import TwitterKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , TWTRComposerViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        TWTRTwitter.sharedInstance().start(withConsumerKey: "gEeQtwqHEWL2wNpVOt9rXQ1uU", consumerSecret: "7MEwDdvmKNvg7p6mCG9byuEm8Glvgiqi6wdaXH3oMCr4P3b4Ni")
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
     
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
      
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
       
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
      
    }

    func applicationWillTerminate(_ application: UIApplication) {
       
    }


}


extension AppDelegate {
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        if TWTRTwitter.sharedInstance().application(app, open: url, options: options) {
            return true
        }
        // Your other open URL handlers follow […]
        return true
        
       
    }
    
    //MARK:- TWTRComposerViewControllerDelegate
    
    func composerDidCancel(_ controller: TWTRComposerViewController) {
        print("composerDidCancel, composer cancelled tweet")
    }
    
    func composerDidSucceed(_ controller: TWTRComposerViewController, with tweet: TWTRTweet) {
        print("composerDidSucceed tweet published")
    }
    func composerDidFail(_ controller: TWTRComposerViewController, withError error: Error) {
        print("composerDidFail, tweet publish failed == \(error.localizedDescription)")
    }
    
}
