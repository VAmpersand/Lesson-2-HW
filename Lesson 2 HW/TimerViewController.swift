//
//  TimerViewController.swift
//  Lesson 2 HW
//
//  Created by Viktor Prikolota on 18.08.2022.
//

import UIKit

protocol SettingDurationDelegate: AnyObject {
    func set(duration: Int)
}

final class TimerViewController: BaseViewController {
 
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Spend 0 sec"
        return label
    }()
    
    private var duration = 0
    private var timerValue = 0
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.setTitle("Start", for: .normal)
        [
            topLabel,
            timerLabel,
            button,
        ].forEach(stackView.addArrangedSubview)
        
        button.addTarget(self, action: #selector(startButtonHandler), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(appResiagnActivaNotify), name: UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActiveNotify), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("timerViewController - viewWillAppear")
        topLabel.text = "Timer at \(duration) sec"
    }
    
    
    @objc func appResiagnActivaNotify() {
        print("timer value = \(self.timerValue)")
        if (self.timerValue > 0) {
            TimerTools.saveTimer(value: timerValue, duration: duration)
        }
    }
    
    @objc func appDidBecomeActiveNotify() {
        if let (result, duration) = TimerTools.restoreTimer() {
            print(result, "RESULT")
            print(duration, "DURATION")
            self.duration = duration
            self.topLabel.text = "Timer at \(duration) sec"
            self.resumeTimer(from: result)
        }
    }
        
    @objc func startButtonHandler() {
        if duration > 0 {
            TimerTools.removeTimer()
            resumeTimer(from: 0)
        } else {
            timerLabel.text = "Will set duration for start"
        }
    }
    
    func resumeTimer(from value: Int) {
        TimerTools.removeTimer()
        timer.invalidate()
        timerValue = value
      
        timerLabel.text = "Spend \(timerValue) sec"
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            
            self.timerValue += 1
            self.timerLabel.text = "Spend \(self.timerValue) sec"
            
            if self.timerValue >= self.duration {
                timer.invalidate()
                self.timerValue = 0
                self.timerLabel.text = "Time out"
            }
        }
    }
}

extension TimerViewController: SettingDurationDelegate {
    func set(duration: Int) {
        self.duration = duration
        print("Duration geted. Value: \(duration)")
        print(self.duration, "current duration")
    }
}
