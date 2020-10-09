//
//  Recognition.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit
import Squid
import Combine

struct Recognition {

    let service = Service(uuid: UUID().uuidString, sessionId: "salam")

    enum RecognitionErorr: Error {
        case canNotProvideDataFromImage
    }
}

extension Recognition {

    func recognize(
        car image: UIImage
    ) throws -> AnyPublisher<Int, Service.Error> {

        guard let data = image.jpegData(compressionQuality: 0.25) else {
            throw RecognitionErorr.canNotProvideDataFromImage
        }
        let request = RecognitionRequest(image: data)

        return request.schedule(with: service)
            .eraseToAnyPublisher()
    }
}
