//
//  Car.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import Foundation

struct Car: Codable {

    let id: Int
    // ?
    let carId: Int

    // ?
    let absentee: Bool
    // ?
    let alias: String
    let prefix: String

    let bodies: [String]

    let brand: [Brand]

    let colorsCount: Int
    let count: Int
    let hasSpecialPrice: Bool

    let metallicPay: Int
    let minPrice: Int

    let model: CarModel

    let ownTitle: String
    let pearlPay: Int

    let photo: URL

    // ?
    let premiumPriceSpecials: [String]

    // ?
    let renderPhotos: [String: Photo]
//    let sizesPhotos: []

    let transportType: CarType
}
