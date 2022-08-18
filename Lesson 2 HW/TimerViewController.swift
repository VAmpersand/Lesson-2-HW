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

final class TimerViewController: UIViewController {

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 50
        return view
    }()

    private let estimationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Spend 0 sec"
        return label
    }()

    private let startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black.withAlphaComponent(0.1)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Start", for: .normal)
        return button
    }()

    private var duration = 0
    private var timerValue = 0
    private var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40)
        ])

        [
            estimationLabel,
            timerLabel,
            startButton,
        ].forEach(stackView.addArrangedSubview)

        estimationLabel.text = "Timer at \(duration) sec"

        startButton.addTarget(self, action: #selector(startButtonHandler), for: .touchUpInside)
    }

    @objc func startButtonHandler() {
        if duration > 0 {
            resumeTimer(from: 0)
            
        } else {
            timerLabel.text = "Will set duration for start"
        }
    }

    func resumeTimer(from value: Int) {
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
    }
}
