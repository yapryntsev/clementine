//
//  CarCell.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit

final class CarCell: UICollectionViewCell {

    static let reuseIdentifier = "CarCell"

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        // Need fix
        imageView.transform = CGAffineTransform(translationX: 48, y: 0)
            .scaledBy(x: 1.2, y: 1.2)
        return imageView
    }()

    private lazy var titleLabel: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.body1
        label.textColor = UIColor.styleGuide.grey90

        return label
    }()

    private lazy var subtitleLabel: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title4
        label.textColor = UIColor.styleGuide.blue60

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

        contentView.clipsToBounds = true

        titleLabel.text = "БМВ 2 серии"
        subtitleLabel.text = "От 94 328,50 ₽ в мес."
        metaLabel.text = "Купе · 2 981 178 ₽"
        imageView.image = UIImage(named: "test")

        let titleWrapper = UIStackView(arrangedSubviews: [
            titleLabel, metaLabel
        ])
        titleWrapper.spacing = 8

        let textWrapper = UIStackView(arrangedSubviews: [
            titleWrapper, subtitleLabel
        ])
        textWrapper.axis = .vertical
        textWrapper.alignment = .leading
        textWrapper.spacing = 4

        let wrapper = UIStackView(arrangedSubviews: [
            textWrapper, imageView
        ])
        wrapper.alignment = .center
        wrapper.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(wrapper)
        addConstraints([
            wrapper.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            wrapper.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor),
            wrapper.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16),
            wrapper.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),

            imageView.widthAnchor.constraint(
                equalTo: imageView.heightAnchor, multiplier: 1.25)
        ])
    }
}
