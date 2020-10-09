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
        let rawImageView = UIImageView()
        rawImageView.translatesAutoresizingMaskIntoConstraints = false
        return rawImageView
    }()

    private lazy var imageViewss: UIImageView = {
        let rawImageView = UIImageView()
        rawImageView.translatesAutoresizingMaskIntoConstraints = false
        return rawImageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configurate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurate() {

        backgroundColor = .red
        imageView.backgroundColor = .blue
        imageViewss.backgroundColor = .green

        let wrapper = UIStackView(arrangedSubviews: [
            imageViewss, imageView
        ])
        wrapper.translatesAutoresizingMaskIntoConstraints = false

        addSubview(wrapper)
        addConstraints([
            wrapper.topAnchor.constraint(
                equalTo: topAnchor, constant: 12),
            wrapper.bottomAnchor.constraint(
                equalTo: bottomAnchor, constant: -12),
            wrapper.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            wrapper.trailingAnchor.constraint(
                equalTo: trailingAnchor),

            imageView.widthAnchor.constraint(
                equalTo: imageView.heightAnchor, multiplier: 1.25)
        ])
    }
}
