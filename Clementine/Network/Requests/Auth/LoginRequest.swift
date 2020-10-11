//
//  LoginRequest.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 10.10.2020.
//

import Foundation
import Squid

struct LoginRequest: JsonRequest {

    typealias Result = String

    let uuidString: String

    var routes: HttpRoute {
        ["v1", "login"]
    }

    var body: HttpBody {
        HttpData.Json([
            "uuid": uuidString
        ])
    }
}
