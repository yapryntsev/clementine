//
//  Coordinator.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit
import Combine

protocol Coordinator {

    var navigation: UINavigationController? { get set }
    var child: Coordinator? { get set }
    var subscribers: Set<AnyCancellable> { get set }

    func start()
}
