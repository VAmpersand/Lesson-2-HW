//
//  SceneDelegate.swift
//  Lesson 2 HW
//
//  Created by Viktor Prikolota on 18.08.2022.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let loger = Loger()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        loger.log(event: UIApplication.didFinishLaunchingNotification)
        let tabBarController = TabBarController()

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        loger.log(event: UIApplication.willEnterForegroundNotification)
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        loger.log(event: UIApplication.didBecomeActiveNotification)
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        loger.log(event: UIApplication.willResignActiveNotification)
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        loger.log(event: UIApplication.didEnterBackgroundNotification)
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        loger.log(event: UIApplication.willTerminateNotification)
    }
}

