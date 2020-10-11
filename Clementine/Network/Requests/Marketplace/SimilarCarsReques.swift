//
//  SimilarCarsReques.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 10.10.2020.
//

import Foundation
import Squid

struct SimilarCarsReques: JsonRequest {

    enum DecodeError: Error {
        case canNotParse
    }

    typealias Result = [Car]

    let image: String

    var routes: HttpRoute {
        ["v1", "cars", "recognition"]
    }

    var method: HttpMethod {
        .post
    }

    var body: HttpBody {
        HttpData.Json([
            "content": image
        ])
    }

    func decode(_ data: Data) throws -> [Car] {

        let rawResult = try JSONDecoder().decode([RawCar].self, from: data)
        let result = rawResult
            .map { car in
                car.bodies.map {
                    Car(
                        title: car.title,
                        titleRus: car.titleRus,
                        id: car.id,
                        carId: car.carId,
                        photo: car.photo,
                        absentee: car.absentee,
                        alias: car.alias,
                        prefix: car.prefix,
                        body: $0,
                        brand: car.brand,
                        colorsCount: car.colorsCount,
                        count: car.count,
                        hasSpecialPrice: car.hasSpecialPrice,
                        metallicPay: car.metallicPay,
                        minPrice: car.minPrice,
                        model: car.model,
                        ownTitle: car.ownTitle,
                        pearlPay: car.pearlPay,
                        premiumPriceSpecials: car.premiumPriceSpecials,
                        transportType: car.transportType)
                }
            }
            .flatMap { $0 }

        if !result.isEmpty {
            return result
        } else {
            throw DecodeError.canNotParse
        }
    }
}
