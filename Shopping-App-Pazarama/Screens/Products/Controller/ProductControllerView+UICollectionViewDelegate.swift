//
//  ProductControllerView+CollectionViewDelegate.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 4.11.2022.
//

import UIKit
import Kingfisher

// MARK: - CollectionViewDelegate

extension ProductViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        productCollectionView.deselectItem(at: indexPath, animated: true)
        print("You tapped me")
        guard let photoAtIndex = viewModel.photoForIndexPath(indexPath) else {return}
        
        
        let sheetViewController = ProductSheetViewController()
        sheetViewController.product = photoAtIndex
        
        self.present(sheetViewController, animated: true)
        }
    }
    

