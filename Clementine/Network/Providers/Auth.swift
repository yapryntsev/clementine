//
//  Auth.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 10.10.2020.
//

import Foundation
import Combine

struct Auth {

    let service = Service(uuid: UUID().uuidString)

    enum MarketplaceErorr: Error {
        case canNotProvideDataFromImage
    }
}

extension Auth {

    // Получение session id
    func login(uuid: UUID) -> AnyPublisher<String, Service.Error> {

        let uuidString = uuid.uuidString
        let request = LoginRequest(uuidString: uuidString)

        return request.schedule(with: service)
            .eraseToAnyPublisher()
    }
}
