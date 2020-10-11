//
//  BlueButton.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 10.10.2020.
//

import UIKit

final class BlueButton: UIButton {

    init() {
        super.init(frame: .zero)
        configurate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurate() {

        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.styleGuide.blue60
        layer.cornerRadius = 8

        addConstraints([
            heightAnchor.constraint(
                equalToConstant: 48)
        ])
    }
}
