//
//  RawCar.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 11.10.2020.
//

import Foundation

struct RawCar: Codable {

    let title: String
    let titleRus: String

    let id: Int
    let carId: Int

    let absentee: Bool
    let alias: String
    let prefix: String

    let bodies: [CarBody]

    let brand: Brand

    let colorsCount: Int
    let count: Int
    let hasSpecialPrice: Bool

    let metallicPay: Int
    let minPrice: Int

    let model: CarModel

    let ownTitle: String
    let pearlPay: Int

    let premiumPriceSpecials: [String]
    let transportType: CarType
}
