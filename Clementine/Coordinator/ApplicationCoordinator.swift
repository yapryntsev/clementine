//
//  ApplicationCoordinator.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit
import Combine

final class ApplicationCoordinator: Coordinator {

    weak var navigation: UINavigationController?
    var subscribers = Set<AnyCancellable>()
    var child: Coordinator?

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
