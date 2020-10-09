//
//  MarketplaceCoordinator.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit

final class MarketplaceCoordinator: Coordinator {

    weak var navigation: UINavigationController?
    var child: Coordinator?

    init(navigation: UINavigationController) {
        self.navigation = navigation
    }

    func start() {
        showMarketeplaceList()
    }

    private func showMarketeplaceList() {

        let model = MarketplaceModel()
        let controller = MarketplaceController(model: model)

        model.view = controller

        controller.output = { [unowned self] in
            self.showCarDetailsScreen()
        }

        navigation?.show(controller, sender: self)
    }

    private func showCarDetailsScreen() {

        let controller = CarDetailsController()
        navigation?.pushViewController(controller, animated: true)
    }
}
