//
//  CameraModel.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 10.10.2020.
//

import UIKit
import Combine

final class CameraModel {

    enum CameraModelError: Error {
        case canNotFindMathes
    }

    private let provider = Marketplace()

    // MARK: - Input
    var input = PassthroughSubject<UIImage, Never>()

    // MARK: - Output
    var output = PassthroughSubject<Result<CarsRequest, CameraModelError>, Never>()

    init() {

        input
            .compactMap { $0 }
            .map { self.provider.cars(similar: $0) }
            .switchToLatest()
            .sink(receiveCompletion: { [unowned self] completion in
                if case .failure(_) = completion {
                    self.output.send(.failure(.canNotFindMathes))
                }
            }, receiveValue: { [unowned self] result in
                self.output.send(.success(result))
            })
            .store(in: &subscribers)
    }

    // MARK: - Subscribers
    private var subscribers = Set<AnyCancellable>()
}
