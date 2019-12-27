//
//  ViewController.swift
//  LocalPushNotification
//
//  Created by hoanglinh on 11/19/19.
//  Copyright © 2019 hoanglinh. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //ASK USER FOR PERMISSION
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
    //CREATE USER NOTIFICATION CONTENT
        let content = UNMutableNotificationContent()
        content.title = "FoodAnything notifications "
        content.body = "Please order now to discount 50% on to day"
        
        //CREATE NOTIFICATIONS NOTIFYING
        let dates = Date().addingTimeInterval(5)
        let dateCoponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: dates)
        let triggerNotifications = UNCalendarNotificationTrigger(dateMatching: dateCoponents, repeats: false)
        
        //CREATE REQUEST NOTIFICATION
        let uuid = UUID().uuidString
        let requestNotification = UNNotificationRequest(identifier:uuid, content:content,trigger:triggerNotifications)
        //REGISTER REQUEST
        center.add(requestNotification) { (error) in
            //check the error 
        }
    }


}

