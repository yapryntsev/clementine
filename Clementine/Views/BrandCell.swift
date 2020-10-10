//
//  BrandCell.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit

final class BrandCell: UICollectionViewCell {

    static let reuseIdentifier = "BrandCell"

    private lazy var logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title4
        label.textColor = UIColor.styleGuide.grey90

        return label
    }()

    private lazy var metaLabel: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.body1
        label.textColor = UIColor.styleGuide.coldGrey40

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

        logoView.image = UIImage(named: "logo")
        titleLabel.text = "БМВ"
        metaLabel.text = "Похожих: 12 Всего: 24"

        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.styleGuide.grey20.cgColor

        let textWrapper = UIStackView(arrangedSubviews: [
            titleLabel, metaLabel
        ])
        textWrapper.spacing = 4
        textWrapper.axis = .vertical

        let wrapper = UIStackView(arrangedSubviews: [
            logoView, textWrapper
        ])
        wrapper.spacing = 16
        wrapper.alignment = .center
        wrapper.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(wrapper)
        addConstraints([
            wrapper.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 16),
            wrapper.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: -16),
            wrapper.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16),
            wrapper.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -16),

            logoView.widthAnchor.constraint(
                equalTo: logoView.heightAnchor)
        ])
    }
}

