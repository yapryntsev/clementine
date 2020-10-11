//
//  MarketplaceModel.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit

final class MarketplaceModel: NSObject {

    let cars: [Car]

    private lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.groupingSize = 3
        formatter.usesGroupingSeparator = true
        return formatter
    }()

    init(cars: [Car]) {
        self.cars = cars
    }

    enum Sections: Int, CaseIterable {
        case list
    }

    weak var view: MarketplaceController?
}

extension MarketplaceModel: UICollectionViewDataSource {

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
        case .list:
            return cars.count
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CarCell.reuseIdentifier, for: indexPath) as! CarCell

        let model = cars[indexPath.row]

        cell.imageURL = model.photo
        cell.title = model.titleRus
        let price = formatter.string(from: NSNumber(value: model.minPrice)) ?? ""
        cell.subtitle = "\(price) ₽"
        cell.meta = model.body.typeTitle

        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {

        let cell = collectionView.dequeueReusableSupplementaryView(
            ofKind: SheetHeader.kind,
            withReuseIdentifier: SheetHeader.reuseIdentifier,
            for: indexPath
        )

        return cell
    }
}
