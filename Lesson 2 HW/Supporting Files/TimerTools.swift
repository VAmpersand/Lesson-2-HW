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


    static func saveTimer(value: Int, and duration: Int) {
        let dateStr = dateFormatter.string(from: Date())
        defaults.set(dateStr, forKey: "timerSavingDate")
        defaults.set(value, forKey: "timerValue")
        defaults.set(duration, forKey: "timerDuration")
    }

    static func restoreTimer() -> (value: Int, duration: Int)? {
       guard let savingDateStr = defaults.string(forKey: "timerSavingDate"),
             let savingDate = dateFormatter.date(from: savingDateStr) else { return nil }

        let prevValue = defaults.integer(forKey: "timerValue")
        let duration = defaults.integer(forKey: "timerDuration")

        let currentDate = dateFormatter.date(from: dateFormatter.string(from: Date()))!
        let result = prevValue + Int(currentDate.timeIntervalSince(savingDate))

        return (result, duration)
    }

    static func removeTimer() {
        defaults.set(nil, forKey: "timerSavingDate")
        defaults.set(nil, forKey: "timerValue")
        defaults.set(nil, forKey: "timerDuration")
    }
}
