//
//  Brand.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import Foundation

struct Brand: Codable {

    let id: Int

    let absentee: Bool
    let alias: String

    let country: Country

    let isOutbound: Bool

    let logo: URL

    let title: String
    let titleRus: String
}
