//
//  CameraCoordinator.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit
import Combine
import Vision
import AVFoundation

final class CameraCoordinator: NSObject, Coordinator {

    weak var navigation: UINavigationController?
    var subscribers = Set<AnyCancellable>()
    var child: Coordinator?

    init(navigation: UINavigationController?) {
        self.navigation = navigation
    }

    func start() {
        showCameraScreen()
        startMarketplaceCoordinator(with: nil)
    }

    private func showCameraScreen() {

        let session = AVCaptureSession()
        guard let model = try? VNCoreMLModel(for: CarDetector().model) else {
            fatalError("Can't get ml model instance")
        }
        let viewModel = CameraModel()
        let controller = CameraController(
            session: session, model: model, viewModel: viewModel)

        controller.output.sink { [unowned self] result in
            self.startMarketplaceCoordinator(with: result)
        }
        .store(in: &subscribers)

        navigation?.setViewControllers([controller], animated: false)
    }

    private func startMarketplaceCoordinator(with result: CarsRequest?) {

        let coordinator = MarketplaceCoordinator(navigation: navigation)

        coordinator.start()
        child = coordinator
    }
}
