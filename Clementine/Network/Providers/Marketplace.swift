//
//  Marketplace.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import Foundation
import Squid
import Combine

struct Marketplace {

    let service = Service(uuid: UUID().uuidString, sessionId: "salam")

    enum RecognitionErorr: Error {
        case canNotProvideDataFromImage
    }
}

extension Marketplace {

    func cars(for brand: Brand) throws -> AnyPublisher<CarList, Service.Error> {
        let request = CarListRequest(brand: brand)
        return request.schedule(with: service)
            .eraseToAnyPublisher()
    }
}
