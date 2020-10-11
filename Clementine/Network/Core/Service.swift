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
        case invalidRequest(message: String)
        case decodingFailed
        case timeout
        case noConnection
        case invalidUrl
        case invalidResponse
        case requestFailed(statusCode: Int, response: Data)
        case unknow
    }

    let uuid: String
    let sessionId: String

    init(uuid: String, sessionId: String = "") {
        self.uuid = uuid
        self.sessionId = sessionId
    }

    var header: HttpHeader {
        ["uuid": uuid, "sessionId": sessionId]
    }

    var apiUrl: UrlConvertible {
        "http://84.201.176.117:80"
    }

    var usesSecureProtocol: Bool {
        return false
    }

    func mapError(_ error: Squid.Error) -> Error {

        switch error {
        case .invalidRequest(message: let message):
            return .invalidRequest(message: message)
        case .decodingFailed:
            return .decodingFailed
        case .timeout:
            return .timeout
        case .noConnection:
            return .noConnection
        case .invalidUrl:
            return .invalidUrl
        case .invalidResponse:
            return .invalidResponse
        case .requestFailed(statusCode: let statusCode, response: let response):
            return .requestFailed(statusCode: statusCode, response: response)
        default:
            return .unknow
        }
    }
}
