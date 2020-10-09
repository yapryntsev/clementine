//
//  MarketplaceModel.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit

final class MarketplaceModel: NSObject {

    enum Sections: Int, CaseIterable {
        case service
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
        case .service:
            return 1
        case .list:
            return 100
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "Cell", for: indexPath)

        cell.backgroundColor = .blue

        return cell
    }
}
