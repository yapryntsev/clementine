//
//  CarModel.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import Foundation

struct CarModel: Codable {

    let id: Int

    let absentee: Bool
    let alias: String

    let prefix: String

    let title: String
    let titleRus: String
}
