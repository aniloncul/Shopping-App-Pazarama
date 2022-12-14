//
//  ProductsViewController.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 31.10.2022.
//

import UIKit
import ShoppingAppAPI

final class ProductViewController: UIViewController, AlertPresentable {
    // MARK: - Properties
    var viewModel: ProductViewModelProtocol
    
    // MARK: - UIElements

    @IBOutlet var productCollectionView: UICollectionView!{
        didSet {
            productCollectionView.delegate = self
            productCollectionView.dataSource = self
            productCollectionView.register(UINib(nibName:"ProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:ProductsCollectionViewCell.identifier)
        }
    }
    
    
    // MARK: - Init
    init(viewModel: ProductViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        viewModel.delegate = self
        
        viewModel.fetchProducts()
    
        
 
        productCollectionView.reloadData()
    }
    
}

// MARK: - Extension
extension ProductViewController: ProductViewModelDelegate{
    func didErrorOccured(_ error: Error) {
        showError(error .localizedDescription as! Error)
    }
    
    func didFetchProducts() {
        productCollectionView.reloadData()
    }
    
    
}


// MARK: - CollectionViewFlowLayout

extension ProductViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: .screenWidth / 2 - 7.0, height: .screenWidth / 2 - 7.0)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            2
        }
    
    
    
}

// MARK : - PresentControllerDelegate

extension ProductViewController : UIAdaptivePresentationControllerDelegate{
    
}

  
