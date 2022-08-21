//
//  Loger.swift
//  Lesson 2 HW
//
//  Created by Danil Demchenko on 21.08.2022.
//

import UIKit

final class Loger {
    func log(event: Notification.Name) {
        switch event {
        case UIApplication.didFinishLaunchingNotification:
            print("didFinishLaunchingNotification - \(Date())")
        case UIApplication.willEnterForegroundNotification:
            print("willEnterForegroundNotification - \(Date())")
        case UIApplication.didBecomeActiveNotification:
            print("didBecomeActiveNotification - \(Date())")
        case UIApplication.willResignActiveNotification:
            print("willResignActiveNotification - \(Date())")
        case UIApplication.didEnterBackgroundNotification:
            print("didEnterBackgroundNotification - \(Date())")
        case UIApplication.willTerminateNotification:
            print("willTerminateNotification - \(Date())")
        default:
            return
        }
    }
}
