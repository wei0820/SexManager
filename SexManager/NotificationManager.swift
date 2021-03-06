//
//  NotificationManager.swift
//  SexManager
//
//  Created by oneplay on 2020/1/10.
//  Copyright © 2020 JackPan. All rights reserved.
//

import Foundation
import NotificationCenter
import CoreLocation
class NotificationManager{

    
    static func setTimeNotification(body :String){
        let appName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String

        /*
         UNTimeIntervalNotificationTrigger = 每幾秒發送。
         UNCalendarNotificationTrigger => 指定日期發送。
         UNLocationNotificationTrigger => 當靠近某個位置時觸發。
         UNPushNotificationTrigger => 從後台發送。
         */
        let content = UNMutableNotificationContent()
        content.title = appName!
        content.subtitle =  DateManager.getDateString2()
        content.body = body
        content.badge = 1
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
            print("成功建立通知...")
        })
    }
    
   static func addPhotoNotification(){
        
    let appName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String

        let content = UNMutableNotificationContent()
               content.title = appName!
               content.subtitle =  DateManager.getDateString2()
               content.body = "body：法蘭克的IOS世界"
               content.badge = 1
               content.sound = UNNotificationSound.default
               
               // 設置通知的圖片
               let imageURL: URL = Bundle.main.url(forResource: "NotificationIcon", withExtension: "png")!
               let attachment = try! UNNotificationAttachment(identifier: "image", url: imageURL, options: nil)
               content.attachments = [attachment]
               
               let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
              
               let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
               
               UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
                   print("成功建立通知...")
               })
    }
    
    static func setLocationNotification(){
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "What are you doing here!?"
        content.body = "Run! This zone is dangerous! :o"
        content.categoryIdentifier = "alarm"
        content.sound = .default
        
        let centerLoc = CLLocationCoordinate2D(latitude: 37.32975796, longitude: -122.01989151)
        let region = CLCircularRegion(center: centerLoc, radius: 100.0, identifier: UUID().uuidString) // radius in meters
        region.notifyOnEntry = true
        region.notifyOnExit = true
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
    
    
    
}
