//
//  CameraModel.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 10.10.2020.
//

import UIKit
import Combine

final class CameraModel {

    private var shouldScheduleRequest = true

    enum CameraModelError: Error {
        case canNotFindMathes
    }

    private let provider = Marketplace()

    // MARK: - Input
    var input = PassthroughSubject<UIImage, Never>()

    // MARK: - Output
    var output = PassthroughSubject<Result<[Car], CameraModelError>, Never>()


    // MARK: - Subscribers
    private var subscribers = Set<AnyCancellable>()

    init() {

        input
            .compactMap { $0 }
            .filter({ [unowned self] _ -> Bool in
                return self.shouldScheduleRequest
            })
            .throttle(for: 1.5, scheduler: RunLoop.main, latest: true)
            .sink(receiveValue: { [unowned self] in
                self.schedule(with: $0)
            })
            .store(in: &subscribers)
    }

    private func schedule(with image: UIImage) {

        shouldScheduleRequest = false

        provider.cars(similar: image)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [unowned self] completion in

                shouldScheduleRequest = true
                if case let .failure(error) = completion {
                    print(error)
                    self.output.send(.failure(.canNotFindMathes))
                }
            }, receiveValue: { [unowned self] result in
                self.output.send(.success(result))
            })
            .store(in: &subscribers)
    }
}
