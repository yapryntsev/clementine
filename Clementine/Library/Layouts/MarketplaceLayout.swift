//
//  MarketplaceLayout.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit

final class MarketplaceLayout: Layout {

    typealias Section = MarketplaceModel.Sections

    func create() -> UICollectionViewLayout {

        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 32

        return UICollectionViewCompositionalLayout(sectionProvider: {
            [weak self] (index, environment) -> NSCollectionLayoutSection? in

            guard let section = Section(rawValue: index) else {
                fatalError("Can't find related section")
            }

            let sectionDescriptor: NSCollectionLayoutSection?

            switch section {
            case .service:
                sectionDescriptor = self?.serviceBanner()
            case .list:
                sectionDescriptor = self?.carList()
            }

            return sectionDescriptor

        }, configuration: configuration)
    }

    private func serviceBanner() -> NSCollectionLayoutSection {

        // Configurate item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 16, leading: 16, bottom: 16, trailing: 16)

        // Configurate group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(64)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize, subitems: [item])

        return NSCollectionLayoutSection(group: group)
    }

    private func carList() -> NSCollectionLayoutSection {

        // Configurate item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 16, leading: 16, bottom: 16, trailing: 16)

        // Configurate group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(64)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize, subitems: [item])

        return NSCollectionLayoutSection(group: group)
    }
}
