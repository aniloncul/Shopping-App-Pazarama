//
//  SearchProductsViewController+DataSource.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 26.11.2022.
//

import UIKit
import Kingfisher

extension SearchProductsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else { fatalError("ProductsCollectionViewCell not found")}
        
        cell.searchLabel.text = viewModel.titleForRow(indexPath.row)
        
        let url = URL(string: (viewModel.photoForIndexPath(indexPath)?.image!)!)
        cell.searchImageView.kf.setImage(with: url)
        
        return cell
    }
}
