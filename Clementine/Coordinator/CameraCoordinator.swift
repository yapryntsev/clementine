//
//  CameraCoordinator.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit
import Vision
import AVFoundation

final class CameraCoordinator: Coordinator {

    weak var navigation: UINavigationController?
    var child: Coordinator?

    init(navigation: UINavigationController?) {
        self.navigation = navigation
    }

    func start() {
        showCameraScreen()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.startMarketplaceCoordinator()
        }
    }

    private func showCameraScreen() {

        let session = AVCaptureSession()
        let model = try! VNCoreMLModel(for: CarDetector().model)
        let controller = CameraController(session: session, model: model)

        controller.output = { [unowned self] in
            self.startMarketplaceCoordinator()
        }

        navigation?.show(controller, sender: self)
    }

    private func startMarketplaceCoordinator() {

        let nestedNavigation = UINavigationController()
        let coordinator = MarketplaceCoordinator(navigation: nestedNavigation)

        coordinator.start()
        child = coordinator

        navigation?.present(nestedNavigation, animated: true)
    }
}
