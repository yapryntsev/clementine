//
//  CameraModel.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 10.10.2020.
//

import UIKit
import Combine

final class CameraModel: NSObject {

    private var shouldProduceOutputFromView = true

    // MARK: - Output
    var output: ((Brand?) -> Void)?

    // MARK: - View
    weak var view: CameraController? {
        didSet {
            setupReceiving()
        }
    }

    // MARK: - Subscribers
    private var subscribers = Set<AnyCancellable>()

    private func setupReceiving() {

        view?.$output
            .receive(on: RunLoop.main)
            .compactMap { $0 }
            .filter { [unowned self] _ in
                self.shouldProduceOutputFromView
            }
            .sink(receiveValue: { [unowned self] observation in
                print(observation)
                self.output?(nil)
                self.shouldProduceOutputFromView = false
            })
            .store(in: &subscribers)
    }
}
