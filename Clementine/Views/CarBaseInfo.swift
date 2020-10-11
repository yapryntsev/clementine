//
//  CarBaseInfo.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 10.10.2020.
//

import UIKit

final class CarBaseInfo: UICollectionViewCell {

    static let reuseIdentifier = "CarBaseInfo"

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    var price: String? {
        didSet {
            priceLabel.text = price
        }
    }

    private lazy var titleLabel: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title3
        label.textColor = UIColor.styleGuide.grey90

        return label
    }()

    private lazy var priceLabel: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.lt2
        label.textColor = UIColor.styleGuide.blue60

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
            titleLabel, priceLabel
        ])
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        wrapper.spacing = 4
        wrapper.axis = .vertical
        wrapper.distribution = .fillProportionally

        contentView.addSubview(wrapper)
        contentView.addConstraints([
            wrapper.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            wrapper.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor),
            wrapper.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            wrapper.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor)
        ])
    }
}
