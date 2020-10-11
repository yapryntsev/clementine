//
//  CarsRequest.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import Foundation

struct CarsRequest: Codable {

    let id: Int

    let alias: String
    let country: Country

    let totalCarCount: Int
    let totalModelCount: Int

    let models: [Car]
    let logo: URL

    enum CodingKeys: CodingKey {
        case id
        case alias
        case country
        case totalCarCount
        case totalModelCount
        case models
        case logo
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        alias = try container.decode(String.self, forKey: .id)
        country = try container.decode(Country.self, forKey: .id)
        totalCarCount = try container.decode(Int.self, forKey: .id)
        totalModelCount = try container.decode(Int.self, forKey: .id)
        logo = try container.decode(URL.self, forKey: .id)

        let rawCars = try container.decode([RawCar].self, forKey: .models)

        models = rawCars
            .map { car in
                car.bodies.map {
                    Car(
                        title: car.title,
                        titleRus: car.titleRus,
                        id: car.id,
                        carId: car.carId,
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
    }
}
