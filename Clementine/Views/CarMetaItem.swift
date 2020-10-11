//
//  CarMetaItem.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 11.10.2020.
//

import UIKit

final class CarMetaItem: UICollectionViewCell {

    static let reuseIdentifier = "CarMetaItem"

    var title: String? {
        didSet {
            keyLabel.text = title
        }
    }

    var subtitle: String? {
        didSet {
            valueLabel.text = subtitle
        }
    }

    private lazy var separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = UIColor.styleGuide.coldGrey20
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()

    private lazy var keyLabel: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.body1
        label.textColor = UIColor.styleGuide.grey90
        label.textAlignment = .left

        return label
    }()

    private lazy var valueLabel: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.body1
        label.textColor = UIColor.styleGuide.blue60
        label.textAlignment = .right

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configurate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurate() {

        let wrapper = UIStackView(arrangedSubviews: [
            keyLabel, valueLabel
        ])
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        wrapper.distribution = .fillProportionally

        contentView.addSubview(wrapper)
        contentView.addSubview(separator)

        contentView.addConstraints([
            wrapper.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            wrapper.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor),
            wrapper.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16),
            wrapper.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -16),

            separator.heightAnchor.constraint(
                equalToConstant: 1),
            separator.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16),
            separator.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            separator.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor)
        ])

        wrapper.frame = contentView.bounds
        wrapper.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
