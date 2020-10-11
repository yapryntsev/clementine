//
//  BrandCarsRequest.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 10.10.2020.
//

import Foundation
import Squid

struct BrandCarsRequest: JsonRequest {

    typealias Result = [Car]

    let brand: Brand

    var routes: HttpRoute {
        ["v1", brand.alias.lowercased()]
    }
}
