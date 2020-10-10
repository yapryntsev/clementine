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
    }

    private func showCameraScreen() {

        let session = AVCaptureSession()
        guard let mlModel = try? VNCoreMLModel(for: CarDetector().model) else {
            fatalError("Can't get ml model instance")
        }
        let viewModel = CameraModel()
        let controller = CameraController(
            session: session, mlModel: mlModel, viewModel: viewModel)

        viewModel.view = controller
        viewModel.output = { [weak self] brand in
            self?.startMarketplaceCoordinator(for: brand)
        }

        navigation?.show(controller, sender: self)
    }

    private func startMarketplaceCoordinator(for brand: Brand?) {

        let nestedNavigation = UINavigationController()
        nestedNavigation.setNavigationBarHidden(true, animated: false)
        let coordinator = MarketplaceCoordinator(navigation: nestedNavigation)

        coordinator.start()
        child = coordinator

        navigation?.present(nestedNavigation, animated: true)
    }
}
