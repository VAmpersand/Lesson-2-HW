//
//  SceneDelegate.swift
//  Lesson 2 HW
//
//  Created by Viktor Prikolota on 18.08.2022.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let tabBarController = TabBarController()

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        Loger.log(event: UIApplication.willEnterForegroundNotification)
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        Loger.log(event: UIApplication.didBecomeActiveNotification)
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        Loger.log(event: UIApplication.willResignActiveNotification)
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        Loger.log(event: UIApplication.didEnterBackgroundNotification)
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        Loger.log(event: UIApplication.willTerminateNotification)
    }
}

