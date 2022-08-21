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
            self.printStringWithDate("didFinishLaunchingNotification")
        case UIApplication.willEnterForegroundNotification:
            self.printStringWithDate("willEnterForegroundNotification")
        case UIApplication.didBecomeActiveNotification:
            self.printStringWithDate("didBecomeActiveNotification")
        case UIApplication.willResignActiveNotification:
            self.printStringWithDate("willResignActiveNotification")
        case UIApplication.didEnterBackgroundNotification:
            self.printStringWithDate("didEnterBackgroundNotification")
        case UIApplication.willTerminateNotification:
            self.printStringWithDate("willTerminateNotification")
        default:
            return
        }
    }
    
    private func printStringWithDate(_ str: String) {
        print("\(str) -- \(Date())")
    }
}
