//
//  BrandDescriptor.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import Foundation

struct CarList: Codable {

    let id: Int

    let alias: String
    let country: Country

    let totalCarCount: Int
    let totalModelCount: Int

    // Not implemented
    // let generations: [String]
    let models: [Car]

    let isOutbound: Bool

    let logo: URL
}
