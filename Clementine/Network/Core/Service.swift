//
//  Service.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import Foundation
import Squid

struct Service: HttpService {

    typealias RequestError = Error

    enum Error: Swift.Error {
        case error
    }

    let uuid: String
    let sessionId: String

    var apiUrl: UrlConvertible {
        ""
    }

    var header: HttpHeader {
        ["uuid": uuid, "session": sessionId]
    }

    func mapError(_ error: Squid.Error) -> Error {
        return .error
    }
}
