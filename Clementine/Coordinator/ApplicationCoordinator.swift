//
//  ApplicationCoordinator.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit
import AVFoundation

final class ApplicationCoordinator {

    var window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        showCameraScreen()
    }

    private func showCameraScreen() {

        let session = AVCaptureSession()
        let controller = CameraController(session: session)

        controller.output = { [unowned self] in
            self.showMarketeplaceList()
        }

        window.rootViewController = controller
    }

    private func showMarketeplaceList() {

    }
}
