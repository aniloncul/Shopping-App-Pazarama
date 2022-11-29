//
//  SearchViewController.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 31.10.2022.
//

import UIKit

class SearchProductViewController: UIViewController, UISearchResultsUpdating, SearchViewModelDelegate, AlertPresentable {
    
    var viewModel: SearchViewModel
    var searchViewModel: SearchViewModelProtocol
    let searchView = SearchView()

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        
        print(text)
    }

    let searchController = UISearchController()

    // MARK: - Init
    init(searchViewModel: SearchViewModelProtocol) {
        self.searchViewModel = searchViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        searchViewModel.delegate = self
        searchViewModel.fetchProducts()
        
    }

}

// MARK: - Extension

extension SearchViewModelDelegate{
    func didErrorOccured(_ error: Error) {
        showError(error .localizedDescription as! Error)
    }
    
    func didFetchProducts() {
        searchView.collectionView.reloadData()

    }
}
