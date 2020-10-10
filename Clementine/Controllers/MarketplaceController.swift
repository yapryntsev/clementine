//
//  MarketplaceController.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit

final class MarketplaceController: Controller {

    // MARK: - Output
    var output: (() -> Void)?

    private lazy var layout: Layout = {
        MarketplaceLayout()
    }()

    private lazy var collection: UICollectionView = {
        UICollectionView(frame: view.bounds, collectionViewLayout: layout.create())
    }()

    private let model: MarketplaceModel

    init(model: MarketplaceModel) {
        self.model = model
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configurate()
    }

    private func configurate() {

        collection.backgroundColor = .clear
        view.backgroundColor = .white

        view.addSubview(collection)
        collection.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        collection.register(
            BrandCell.self, forCellWithReuseIdentifier: BrandCell.reuseIdentifier)
        collection.register(
            CarCell.self, forCellWithReuseIdentifier: CarCell.reuseIdentifier)
        collection.register(
            SheetHeader.self,
            forSupplementaryViewOfKind: SheetHeader.kind,
            withReuseIdentifier: SheetHeader.reuseIdentifier)

        collection.dataSource = model
        collection.delegate = self
    }
}

extension MarketplaceController: UICollectionViewDelegate {

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        output?()
    }
}
