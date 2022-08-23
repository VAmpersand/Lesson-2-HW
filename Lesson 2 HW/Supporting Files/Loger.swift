//
//  Loger.swift
//  Lesson 2 HW
//
//  Created by Danil Demchenko on 21.08.2022.
//

import UIKit

final class Loger {
    static func log(event: Notification.Name) {
        switch event {
        case UIApplication.didFinishLaunchingNotification:
            printStringWithDate("didFinishLaunchingNotification")
        case UIApplication.willEnterForegroundNotification:
            printStringWithDate("willEnterForegroundNotification")
        case UIApplication.didBecomeActiveNotification:
            printStringWithDate("didBecomeActiveNotification")
        case UIApplication.willResignActiveNotification:
            printStringWithDate("willResignActiveNotification")
        case UIApplication.didEnterBackgroundNotification:
            printStringWithDate("didEnterBackgroundNotification")
        case UIApplication.willTerminateNotification:
            printStringWithDate("willTerminateNotification")
        default:
            break
        }
    }
    
    private static func printStringWithDate(_ str: String) {
        print("\(str) -- \(Date())")
    }
}
