//
//  MarketplaceCoordinator.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit
import Combine

final class MarketplaceCoordinator: NSObject, Coordinator {

    weak var navigation: UINavigationController?
    var subscribers = Set<AnyCancellable>()
    var child: Coordinator?

    private lazy var nestedNavigation: UINavigationController = {
        let navigation = UINavigationController()
        navigation.navigationBar.shadowImage = UIImage()
        navigation.navigationBar.isTranslucent = false
        navigation.navigationBar.tintColor = UIColor.styleGuide.blue60
        return navigation
    }()

    init(navigation: UINavigationController?) {
        self.navigation = navigation
    }

    func start() {
        showMarketeplaceList(with: [])
        navigation?.present(nestedNavigation, animated: true)
    }

    func start(delegate: UIAdaptivePresentationControllerDelegate, cars: [Car]) {
        nestedNavigation.presentationController?.delegate = delegate
        showMarketeplaceList(with: cars)
        navigation?.present(nestedNavigation, animated: true)
    }

    private func showMarketeplaceList(with cars: [Car]) {
        
        let model = MarketplaceModel(cars: cars)
        let controller = MarketplaceController(model: model)

        model.view = controller
        
        controller.output = { [unowned self] in
            self.showCarDetailsScreen(car: $0)
        }
        
        nestedNavigation.setViewControllers([controller], animated: false)
    }

    private func showCarDetailsScreen(car: Car) {

        let viewModel = CarDetailsModel(car: car)
        let controller = CarDetailsController(viewModel: viewModel)

        viewModel.output = {
            // Show loan coordinator
        }

        nestedNavigation.pushViewController(controller, animated: true)
    }
}
