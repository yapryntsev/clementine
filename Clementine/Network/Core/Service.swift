//
//  Service.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import Foundation
import Squid

struct Service: HttpService {

    enum Error: Swift.Error {
        case error
    }

    typealias RequestError = Error

    var apiUrl: UrlConvertible {
        ""
    }

    func mapError(_ error: Squid.Error) -> Error {
        return .error
    }
}
