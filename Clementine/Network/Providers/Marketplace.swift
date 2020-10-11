//
//  Marketplace.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit
import Squid
import Combine

struct Marketplace {

    let service = Service(uuid: UUID().uuidString, sessionId: "salam")

    enum MarketplaceErorr: Error {
        case canNotProvideDataFromImage
    }
}

extension Marketplace {

    // Список всех машин, доступных на маркетплейсе
    var cars: AnyPublisher<[CarsRequest], Service.Error> {
        let request = AllCarsRequest()
        return request.schedule(with: service)
            .eraseToAnyPublisher()
    }

    // Список всех машин, похожих на машину на фото
    func cars(similar image: UIImage) -> AnyPublisher<CarsRequest, Service.Error> {

        guard let data = image.jpegData(compressionQuality: 0.25) else {
            fatalError("Can't produce Data from UIImage")
        }

        let string = data.base64EncodedString(options: .endLineWithCarriageReturn)
        let request = SimilarCarsReques(image: string)

        return request.schedule(with: service)
            .eraseToAnyPublisher()
    }

    // Список всех машин конкретного бренда
    func cars(for brand: Brand) throws -> AnyPublisher<CarsRequest, Service.Error> {
        let request = BrandCarsRequest(brand: brand)
        return request.schedule(with: service)
            .eraseToAnyPublisher()
    }
}
