//
//  RecognitionRequest.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import Foundation
import Squid

struct RecognitionRequest: JsonRequest {

    typealias Result = Int

    let image: Data

    var method: HttpMethod {
        .post
    }

    var routes: HttpRoute {
        ["recognition"]
    }

    var body: HttpBody {
        HttpData.Image(.jpeg, data: image)
    }
}
