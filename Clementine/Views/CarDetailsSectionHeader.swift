//
//  CarDetailsSectionHeader.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 11.10.2020.
//

import UIKit

final class CarDetailsSectionHeader: UICollectionReusableView {

    static let reuseIdentifier = "CarDetailsSectionHeader"
    static let kind = "header"

    var title: String? {
        didSet {
            label.text = title
        }
    }

    private lazy var label: UILabel = {

        let label = UILabel()
        label.font = UIFont.styleGuide.title1
        label.textColor = UIColor.styleGuide.grey90
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
            label
        ])
        wrapper.translatesAutoresizingMaskIntoConstraints = false

        addSubview(wrapper)
        addConstraints([
            wrapper.topAnchor.constraint(
                equalTo: topAnchor, constant: 0),
            wrapper.bottomAnchor.constraint(
                equalTo: bottomAnchor, constant: 0),
            wrapper.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 16),
            wrapper.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -16)
        ])
    }
}

