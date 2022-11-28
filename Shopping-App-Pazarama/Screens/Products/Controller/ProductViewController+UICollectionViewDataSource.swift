//
//  ProductViewController+UICollectionViewDataSource.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 4.11.2022.
//

import UIKit
import Kingfisher

// MARK: - CollectionViewDataSource

extension ProductViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.identifier, for: indexPath) as? ProductsCollectionViewCell else {fatalError("ProductsCollectionViewCell not found")}
        
        let photoAtIndex = viewModel.photoForIndexPath(indexPath)

        _ = photoAtIndex?.image ?? ""
        cell.productLabel.text = viewModel.titleForRow(indexPath.row)
        
        cell.layer.cornerRadius = 9.0
        cell.layer.borderColor = UIColor.systemGray3.cgColor
        cell.layer.borderWidth = 1
    
        
        
        let url = URL(string: (viewModel.photoForIndexPath(indexPath)?.image!)!)
        cell.productImage.kf.setImage(with: url)
        
        productCollectionView.reloadItems(at: [indexPath])
        
            
            
            return cell
        }
        
        
    }

