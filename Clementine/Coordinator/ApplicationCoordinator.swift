//
//  ApplicationCoordinator.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit

final class ApplicationCoordinator {

    private weak var navigation: UINavigationController?
    private var child: Coordinator?

    init(navigation: UINavigationController?) {
        self.navigation = navigation
    }

    func start() {
        startCameraCoordinator()
    }

    private func startCameraCoordinator() {
        
        let coordinator = CameraCoordinator(navigation: navigation)

        coordinator.start()
        child = coordinator
    }
}
