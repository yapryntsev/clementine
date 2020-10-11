//
//  AllCarsRequest.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import Foundation
import Squid

struct AllCarsRequest: JsonRequest {
    
    typealias Result = [Car]

    var routes: HttpRoute {
        ["v1", "cars"]
    }
}
