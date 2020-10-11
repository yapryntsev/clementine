//
//  SimilarCarsReques.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 10.10.2020.
//

import Foundation
import Squid

struct SimilarCarsReques: JsonRequest {

    typealias Result = CarsRequest

    let image: String

    var routes: HttpRoute {
        ["v1", "cars", "recognition"]
    }

    var method: HttpMethod {
        .post
    }

    var body: HttpBody {
        HttpData.Json([
            "content": image
        ])
    }
}
