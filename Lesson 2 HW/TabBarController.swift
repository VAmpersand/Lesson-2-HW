//
//  TabBarController.swift
//  Lesson 2 HW
//
//  Created by Viktor Prikolota on 18.08.2022.
//

import UIKit

final class TabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        configureAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configureAppearance()
    }

    private func configureAppearance() {
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.layer.borderWidth = 0.5

        let timerController = TimerViewController()
        timerController.tabBarItem = UITabBarItem(title: "Timer", image: UIImage(systemName: "timer"), tag: 0)

        let settingsController = SettingsViewController()
        settingsController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 1)
        settingsController.delegate = timerController

        setViewControllers([timerController, settingsController], animated: false)
    }
}
