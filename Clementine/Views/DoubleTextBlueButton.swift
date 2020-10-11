//
//  BlueButton.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 10.10.2020.
//

import UIKit

final class DoubleTextBlueButton: UIButton {

    var leadingText: String? {
        didSet {
            leadingLabel.text = leadingText
        }
    }

    var trailingText: String? {
        didSet {
            trailingLabel.text = trailingText
        }
    }

    private lazy var leadingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.styleGuide.subhead3
        label.textAlignment = .left
        return label
    }()

    private lazy var trailingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.styleGuide.body1
        label.textAlignment = .right
        return label
    }()

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

        let wrapper = UIStackView(arrangedSubviews: [
            leadingLabel, trailingLabel
        ])
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        wrapper.distribution = .fillProportionally

        addSubview(wrapper)
        addConstraints([
            heightAnchor.constraint(
                equalToConstant: 48),

            wrapper.topAnchor.constraint(
                equalTo: topAnchor, constant: 16),
            wrapper.bottomAnchor.constraint(
                equalTo: bottomAnchor, constant: -16),
            wrapper.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 16),
            wrapper.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -16)
        ])
    }
}
