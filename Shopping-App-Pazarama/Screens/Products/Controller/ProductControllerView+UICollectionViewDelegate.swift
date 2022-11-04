//
//  ProductControllerView+CollectionViewDelegate.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 4.11.2022.
//

import UIKit

// MARK: - CollectionViewDelegate

extension ProductViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        productCollectionView.deselectItem(at: indexPath, animated: true)
        print("You tapped me")
    }
}
