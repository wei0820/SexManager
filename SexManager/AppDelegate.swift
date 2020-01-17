//
//  AppDelegate.swift
//  SexManager
//
//  Created by oneplay on 2019/12/24.
//  Copyright © 2019 JackPan. All rights reserved.
//

import UIKit
import GoogleMobileAds
import Firebase
import FacebookCore
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , UNUserNotificationCenterDelegate{

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        FirebaseApp.configure()
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        window?.makeKeyAndVisible()
        
      // 在程式一啟動即詢問使用者是否接受圖文(alert)、聲音(sound)、數字(badge)三種類型的通知
              UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge, .carPlay], completionHandler: { (granted, error) in
                  if granted {
                      print("允許")
                  } else {
                      print("不允許")
                  }
              })
        UNUserNotificationCenter.current().delegate = self 

        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
         return ApplicationDelegate.shared.application(
             application,
             open: url,
             sourceApplication: sourceApplication,
             annotation: annotation
         )
     }
    // 在前景收到通知時所觸發的 function
     func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
         print("在前景收到通知...")
         completionHandler([.badge, .sound, .alert])
     }
    func applicationDidBecomeActive(_ application: UIApplication) {
        //從後臺到前景
        
        
    }
}

