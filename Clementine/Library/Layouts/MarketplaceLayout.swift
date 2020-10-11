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

        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(80)
        )

        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: "header",
            alignment: .top
        )
        header.pinToVisibleBounds = true

        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 24
        configuration.boundarySupplementaryItems = [header]

        return UICollectionViewCompositionalLayout(sectionProvider: {
            [weak self] (index, environment) -> NSCollectionLayoutSection? in

            guard let section = Section(rawValue: index) else {
                fatalError("Can't find related section")
            }

            let sectionDescriptor: NSCollectionLayoutSection?

            switch section {
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

        // Configurate group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(80)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 1
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 16, bottom: 0, trailing: 16)

        return section
    }

    private func carList() -> NSCollectionLayoutSection {

        // Configurate item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Configurate group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(96)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 1

        return section
    }
}
