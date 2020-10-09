//
//  Coordinator.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit

@objc
protocol Coordinator {

    weak var navigation: UINavigationController? { get set }
    var child: Coordinator? { get set }

    func start()
}
