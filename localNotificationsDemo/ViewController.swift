//
//  ViewController.swift
//  localNotificationsDemo
//
//  Created by Abdalla on 10/25/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Ask the user for the notification
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound])
        {
            (granted, error) in
        }
        // Create the Notification content
        let conttent = UNMutableNotificationContent()
        conttent.title = "Hey I'm Notification"
        conttent.body = "Look At Me, Clock '10' "

        //Create the notification trigger
        let date = Date().addingTimeInterval(10)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let triggger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        // Create the Request
        let uuIdString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuIdString, content: conttent, trigger: triggger)

        //Register the request
        center.add(request) { (error) in
            //Check the error parameters and handle my errors
        }

    }
}

