//
//  CarDetailsModel.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 10.10.2020.
//

import UIKit

final class CarDetailsModel: NSObject {

    private let car: Car

    // MARL: - Output
    var output: (() -> Void)?

    init(car: Car) {
        self.car = car
        super.init()
    }

    enum Sections: Int, CaseIterable {
        case gallery
        case baseInfo
        case meta
        case similar
    }

    private lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.groupingSize = 3
        formatter.usesGroupingSeparator = true
        return formatter
    }()

    weak var view: CarDetailsModel?

    private func setupGallery(for cell: UICollectionViewCell) {

        guard let cell = cell as? GalleryItem else {
            fatalError()
        }

        cell.url = car.photo
    }

    private func setupBaseInfo(for cell: UICollectionViewCell) {

        guard let cell = cell as? CarBaseInfo else {
            fatalError()
        }

        let price = formatter.string(from: NSNumber(value: car.minPrice)) ?? ""

        cell.title = "\(car.brand.titleRus) \(car.model.titleRus) \(car.ownTitle)"
        cell.price = "\(price) ₽"
    }

    private func setupMeta(for cell: UICollectionViewCell, at indexPath: IndexPath) {

        guard let cell = cell as? CarMetaItem else {
            fatalError()
        }

        switch indexPath.item {
        case 0:
            cell.title = "Производитель"
            cell.subtitle = car.brand.titleRus
        case 1:
            cell.title = "Страна"
            cell.subtitle = car.brand.country.title
        case 2:
            cell.title = "Кузов"
            cell.subtitle = car.body.typeTitle
        case 3:
            cell.title = "Дверей"
            cell.subtitle = String(car.body.doors)
        case 4:
            cell.title = "Расцветок"
            cell.subtitle = "\(car.colorsCount) варианта"
        case 5:
            cell.title = "В наличии"
            cell.subtitle = "\(car.count) штук"
        case 6:
            cell.title = "Категория"
            cell.subtitle = car.transportType.title
        default:
            break
        }
    }
}

extension CarDetailsModel: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Sections.allCases.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {

        guard let section = Sections(rawValue: section) else {
            fatalError("Section is out of range")
        }

        switch section {
        case .gallery:
            return 1
        case .baseInfo:
            return 1
        case .meta:
            return 7
        case .similar:
            return 10
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        guard let section = Sections(rawValue: indexPath.section) else {
            fatalError("")
        }

        let cell: UICollectionViewCell
        let reuseIdentifier: String

        switch section {
        case .gallery:
            reuseIdentifier = GalleryItem.reuseIdentifier
            cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: reuseIdentifier, for: indexPath)
            setupGallery(for: cell)
        case .baseInfo:
            reuseIdentifier = CarBaseInfo.reuseIdentifier
            cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: reuseIdentifier, for: indexPath)
            setupBaseInfo(for: cell)
        case .meta:
            reuseIdentifier = CarMetaItem.reuseIdentifier
            cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: reuseIdentifier, for: indexPath)
            setupMeta(for: cell, at: indexPath)
        case .similar:
            reuseIdentifier = SimilarWidgetItem.reuseIdentifier
            cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: reuseIdentifier, for: indexPath)
        }

        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {

        if kind == "footer" {
            return collectionView.dequeueReusableSupplementaryView(
                ofKind: ApplyLoan.kind,
                withReuseIdentifier: ApplyLoan.reuseIdentifier,
                for: indexPath
            )
        }

        let cell = collectionView.dequeueReusableSupplementaryView(
            ofKind: CarDetailsSectionHeader.kind,
            withReuseIdentifier: CarDetailsSectionHeader.reuseIdentifier,
            for: indexPath
        ) as! CarDetailsSectionHeader

        guard let section = Sections(rawValue: indexPath.section) else {
            fatalError("")
        }

        switch section {
        case .meta:
            cell.title = "Об авто"
        case .similar:
            cell.title = "Похожие"
        default:
            break
        }

        return cell
    }
}
