//
//  CarListRequest.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import Foundation
import Squid

struct CarListRequest: JsonRequest {
    
    typealias Result = CarList

    let brand: Brand

    var routes: HttpRoute {
        ["v1", "marketplace"]
    }

    enum CodingKeys: CodingKey {
        case list
    }
}
