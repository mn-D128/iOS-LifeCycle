//
//  AppDelegate.swift
//  iOS-LifeCycle
//
//  Created by mn(D128) on 2018/05/02.
//  Copyright © 2018年 mn(D128). All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print("AppDelegate application(_:didFinishLaunchingWithOptions:)")
        
        let mainScreen: UIScreen = UIScreen.main
        let frame: CGRect = mainScreen.bounds

        self.window = UIWindow(frame: frame)
        
        let sb: UIStoryboard = UIStoryboard(name: "ViewController", bundle: nil)
        if let vc: UIViewController = sb.instantiateInitialViewController() {
            vc.title = "画面0"
            
            let nc: UINavigationController = UINavigationController(rootViewController: vc)
            self.window?.rootViewController = nc
        }

        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("AppDelegate applicationWillResignActive")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("AppDelegate applicationDidEnterBackground")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("AppDelegate applicationWillEnterForeground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("AppDelegate applicationDidBecomeActive")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("AppDelegate applicationWillTerminate")
    }

}

