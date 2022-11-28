//
//  SearchProductsViewController+Delegate.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 26.11.2022.
//

import UIKit

extension SearchProductsViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let products = viewModel.photoForIndexPath(indexPath) else {return}
        let sheetViewController = ProductSheetViewController()
        sheetViewController.product = products
        
        self.present(sheetViewController, animated: true)
    }
}
