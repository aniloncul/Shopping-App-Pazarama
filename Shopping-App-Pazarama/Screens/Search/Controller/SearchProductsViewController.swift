//
//  SearchProductsViewController.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 6.11.2022.
//


import UIKit

final class SearchProductsViewController: UIViewController {
    
    
    
    var viewModel = SearchProductsViewModel()
    let searchView = SearchView()
    
    //   init(viewModel: SearchProductsViewModel) {
    //       self.viewModel = viewModel
    //       super.init(nibName: nil, bundle: nil)
    //   }
    //
    //   required init?(coder: NSCoder) {
    //       fatalError("init(coder:) has not been implemented")
    //   }
    
    override func viewDidLoad() {
        viewModel.fetchProducts()
        super.viewDidLoad()
        
        view = searchView
        //setCollectionViewDelegate()
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        viewModel.fetchProducts()
        searchView.collectionView.reloadData()
    }
    
    func setCollectionViewDelegate() {
            searchView.collectionView.delegate = self
            searchView.collectionView.dataSource = self
        }
}

extension SearchProductsViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let photoAtIndex = viewModel.photoForIndexPath(indexPath) else {fatalError("Photo is nil")}
        
        let sheetViewController = ProductSheetViewController()
        sheetViewController.product = photoAtIndex
        present(sheetViewController, animated: true, completion: nil)
    }
}

extension SearchProductsViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SearchCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        let photoAtIndex = viewModel.photoForIndexPath(indexPath)
        
        
        let url = URL(string: (viewModel.photoForIndexPath(indexPath)?.image!)!)
        cell.photoImageView.kf.setImage(with: url)
        
        collectionView.reloadItems(at: [indexPath])
        
            
            
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
}

extension SearchProductsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            viewModel.fetchProducts()
        }else{
            viewModel.fetchProducts()
        }
    }
}


