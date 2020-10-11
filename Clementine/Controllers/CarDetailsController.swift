//
//  CarDetailsController.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit

final class CarDetailsController: Controller {

    private let viewModel: CarDetailsModel

    private lazy var layout: Layout = {
        CarDetailsLayout()
    }()

    private lazy var collection: UICollectionView = {
        UICollectionView(frame: view.bounds, collectionViewLayout: layout.create())
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurate()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    init(viewModel: CarDetailsModel) {
        self.viewModel = viewModel
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurate() {

        title = "Объявление"

        collection.backgroundColor = .clear
        view.backgroundColor = .white

        view.addSubview(collection)
        collection.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        collection.register(
            GalleryItem.self, forCellWithReuseIdentifier: GalleryItem.reuseIdentifier)
        collection.register(
            CarBaseInfo.self, forCellWithReuseIdentifier: CarBaseInfo.reuseIdentifier)
        collection.register(
            CarMetaItem.self, forCellWithReuseIdentifier: CarMetaItem.reuseIdentifier)
        collection.register(
            SimilarWidgetItem.self, forCellWithReuseIdentifier: SimilarWidgetItem.reuseIdentifier)
        collection.register(
            CarCell.self, forCellWithReuseIdentifier: CarCell.reuseIdentifier)
        collection.register(
            ApplyLoan.self,
            forSupplementaryViewOfKind: ApplyLoan.kind,
            withReuseIdentifier: ApplyLoan.reuseIdentifier)
        collection.register(
            CarDetailsSectionHeader.self,
            forSupplementaryViewOfKind: CarDetailsSectionHeader.kind,
            withReuseIdentifier: CarDetailsSectionHeader.reuseIdentifier)

        collection.dataSource = viewModel
    }
}
