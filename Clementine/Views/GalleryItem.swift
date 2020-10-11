//
//  GalleryItem.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 10.10.2020.
//

import UIKit
import Kingfisher

final class GalleryItem: UICollectionViewCell {

    static let reuseIdentifier = "GalleryItem"

    var url: URL? {
        didSet {
            imageView.kf.setImage(with: url)
        }
    }

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configurate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurate() {
        
        addSubview(imageView)
        imageView.frame = bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.styleGuide.grey20.cgColor
    }
}

