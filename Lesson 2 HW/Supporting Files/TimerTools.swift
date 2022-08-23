//
//  TimerTools.swift
//  Lesson 2 HW
//
//  Created by Viktor Prikolota on 18.08.2022.
//

import Foundation
import UIKit

final class TimerTools {

    private static var defaults = UserDefaults.standard
    private static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd_MM_yy hh:mm:ss"
        formatter.timeZone = TimeZone.ReferenceType.system
        return formatter
    }

    static func saveTimer(value: Int, duration: Int) {
        let dateStr = dateFormatter.string(from: Date())
        defaults.set(dateStr, forKey: "timerSavingDate")
        defaults.set(value, forKey: "timerValue")
        defaults.set(duration, forKey: "timerDuration")

        print("Saved timer value: \(value) at date: \(dateStr)")
    }

    static func restoreTimer() -> (Int, Int)? {
       guard let savingDateStr = defaults.string(forKey: "timerSavingDate"),
             let savingDate = dateFormatter.date(from: savingDateStr) else { return nil }

        let prevValue = defaults.integer(forKey: "timerValue")
        let currentDate = dateFormatter.date(from: dateFormatter.string(from: Date()))!
        let timrDiff = currentDate.timeIntervalSince(savingDate)
        let result = prevValue + Int(timrDiff)
        let duration = defaults.integer(forKey: "timerDuration")
        print("Restored timer value: \(result) at date: \(Date()), timer duration: \(duration)")
        
        return (result, duration)
    }

    static func removeTimer() {
        defaults.set(nil, forKey: "timerSavingDate")
        defaults.set(nil, forKey: "timerValue")
        defaults.set(nil, forKey: "tiemrDuration")
    }
}
