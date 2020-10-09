//
//  BrandCell.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit

final class BrandCell: UICollectionViewCell {

    static let reuseIdentifier = "BrandCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        configurate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurate() {

        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
}

