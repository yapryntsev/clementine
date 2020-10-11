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
    weak var rootController: CameraController?

    init(navigation: UINavigationController?) {
        self.navigation = navigation
    }

    func start() {
        showCameraScreen()
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
        rootController = controller
    }

    private func startMarketplaceCoordinator(with cars: [Car]) {

        rootController?.shouldProduceOutput = false
        let coordinator = MarketplaceCoordinator(navigation: navigation)
        coordinator.start(delegate: self, cars: cars)
        child = coordinator
    }
}

extension CameraCoordinator: UIAdaptivePresentationControllerDelegate {

    func presentationControllerDidDismiss(
        _ presentationController: UIPresentationController) {
        rootController?.shouldProduceOutput = true
    }
}
