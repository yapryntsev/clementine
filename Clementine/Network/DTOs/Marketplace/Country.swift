//
//  Country.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import Foundation

// Объект, описывающий страну производителя
struct Country: Codable {

    let id: Int
    let code: String
    let title: String
}
