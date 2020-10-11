//
//  CalculatorWidget.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 11.10.2020.
//

import UIKit

final class SimilarWidgetItem: UICollectionViewCell {

    static let reuseIdentifier = "SimilarWidgetItem"

    override init(frame: CGRect) {
        super.init(frame: frame)
        configurate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurate() {

        let subview = UIView()
        subview.backgroundColor = UIColor.styleGuide.coldGrey5
        subview.layer.cornerRadius = 12
        subview.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(subview)
        contentView.addConstraints([
            subview.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            subview.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor),
            subview.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16),
            subview.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor)
        ])
    }
}

