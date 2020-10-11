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
        showMarketeplaceList()
        navigation?.present(nestedNavigation, animated: true)
    }

    private func showMarketeplaceList() {
        
        let model = MarketplaceModel()
        let controller = MarketplaceController(model: model)

        model.view = controller
        
        controller.output = { [unowned self] in
            self.showCarDetailsScreen()
        }
        
        nestedNavigation.setViewControllers([controller], animated: false)
    }

    private func showCarDetailsScreen() {

        let car = Car(
            title: "Granta",
            titleRus: "Гранта",
            id: 9663,
            carId: 323,
            absentee: true,
            alias: "granta",
            prefix: "",
            body: CarBody(alias: "", doors: 5, photo: URL(string: "https://tradeins.space/uploads/photo/511795/hetch.png")!, title: "", type: "", typeTitle: "Хэтчбек"),
            brand: Brand(id: 83, absentee: true, alias: "LADA", country: Country(id: 14, code: "RU", title: "Россия"), isOutbound: false, logo: URL(string: "http://test.ru")!, title: "lada", titleRus: "Лада"),
            colorsCount: 4,
            count: 5,
            hasSpecialPrice: true,
            metallicPay: 0,
            minPrice: 470900,
            model: CarModel(id: 2441, absentee: true, alias: "granta", prefix: "", title: "Granta", titleRus: "Гранта"),
            ownTitle: "I Рестайлинг",
            pearlPay: 32,
            premiumPriceSpecials: [],
            transportType: CarType(id: 34, alias: "cars", title: "Легковые")
        )

        let viewModel = CarDetailsModel(car: car)
        let controller = CarDetailsController(viewModel: viewModel)

        viewModel.output = {
            print("Salam")
        }

        nestedNavigation.pushViewController(controller, animated: true)
    }
}
