//
//  SheetHeader.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 10.10.2020.
//

import UIKit

final class SheetHeader: UICollectionReusableView {

    static let reuseIdentifier = "SheetHeader"
    static let kind = "header"

    var action: (() -> Void)?

    private lazy var label: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title1
        label.textColor = UIColor.styleGuide.grey90

        return label
    }()

    private lazy var button: UIButton = {

        let button = UIButton()

        button.tintColor = UIColor.styleGuide.grey40
        button.setImage(UIImage.styleGuide.iconAsset(for: .close), for: .normal)

        button.addTarget(
            self, action: #selector(closeButtonDidTapped), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configurate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurate() {

        label.text = "Маркетплейс"

        let wrapper = UIStackView(arrangedSubviews: [
            label, button
        ])
        wrapper.translatesAutoresizingMaskIntoConstraints = false

        addSubview(wrapper)
        addConstraints([
            wrapper.topAnchor.constraint(
                equalTo: topAnchor, constant: 26),
            wrapper.bottomAnchor.constraint(
                equalTo: bottomAnchor, constant: -26),
            wrapper.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 16),
            wrapper.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -26),

            button.widthAnchor.constraint(
                equalTo: button.heightAnchor)
        ])
    }

    @objc
    private func closeButtonDidTapped() {
        action?()
    }
}
