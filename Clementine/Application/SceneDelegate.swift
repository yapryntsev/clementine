//
//  SceneDelegate.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit
import AVFoundation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: ApplicationCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }

        let rawWindow = UIWindow(frame: UIScreen.main.bounds)

        // Configurate window
        rawWindow.windowScene = windowScene
        window = rawWindow

        // Configurate coordinator
        let rawCoordinator = ApplicationCoordinator(window: rawWindow)
        coordinator = rawCoordinator

        window?.makeKeyAndVisible()
        coordinator?.start()
    }
}

