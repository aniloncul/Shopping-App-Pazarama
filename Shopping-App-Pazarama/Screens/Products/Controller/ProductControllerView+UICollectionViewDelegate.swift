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
        
        //sheetViewController.sheetTitleLabel.text = viewModel.titleForRow(indexPath.row)
        
        self.present(sheetViewController, animated: true)
        
       
        //let url = URL(string: photoAtIndex.image!)
        //DispatchQueue.main.async {
          //  sheetViewController.sheetImageView.image = UIImage(named: "pazarama.jpeg")! //self.viewModel.photoForIndexPath(indexPath: indexPath).image!
            
        }
        
        
        //let url = URL(string: viewModel.photoForIndexPath(indexPath: indexPath).image!)
        //cell.productImage.kf.setImage(with: url)
        
        //sheetViewController.sheetImageView.kf.setImage(with: url)
        
        
        
    }
    

