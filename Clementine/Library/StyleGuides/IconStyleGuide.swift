//
//  IconStyleGuide.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 10.10.2020.
//

import UIKit

struct IconStyleGuide {

    func iconAsset(for name: Name) -> UIImage? {
        return UIImage(named: name.rawValue)
    }
}

extension IconStyleGuide {

    public enum Name: String {

        case close
        case navigationRight
    }
}
