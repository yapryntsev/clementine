//
//  ApplyLoan.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 10.10.2020.
//

import UIKit

final class ApplyLoan: UICollectionReusableView {

    static let reuseIdentifier = "ApplyLoan"
    static let kind = "footer"

    var action: (() -> Void)?

    private lazy var button: BlueButton = {
        return BlueButton()
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configurate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurate() {

        button.setTitle("Подать заявку", for: .normal)

        button.layer.shadowColor = UIColor.styleGuide.grey90.cgColor
        button.layer.shadowOpacity = 0.32
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 6

        addSubview(button)
        addConstraints([
            button.topAnchor.constraint(
                equalTo: topAnchor),
            button.bottomAnchor.constraint(
                equalTo: bottomAnchor, constant: -16),
            button.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 8),
            button.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -8),
        ])

        button.addTarget(self, action: #selector(closeButtonDidTapped), for: .touchUpInside)
    }

    @objc
    private func closeButtonDidTapped() {
        action?()
    }
}
