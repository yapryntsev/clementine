//
//  Coordinator.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit

protocol Coordinator {

    var navigationController: UINavigationController? { get set }
    func start()
}
