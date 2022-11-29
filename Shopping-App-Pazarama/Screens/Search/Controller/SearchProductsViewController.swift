//
//  SearchProductsViewController.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 6.11.2022.
//


import UIKit

final class SearchProductsViewController: UIViewController, AlertPresentable {
    // MARK: - Properties
    var viewModel: SearchViewModelProtocol
    
    // MARK: - UIElements
    @IBAction func filterProduct(_ sender: Any) {
        let title = searchSegmentedControl.titleForSegment(at: searchSegmentedControl.selectedSegmentIndex)
        viewModel.fetchProducts(categorytext: title ?? "")
        searchCollectionView.reloadData()
    }
    
    @IBOutlet weak var searchSegmentedControl: UISegmentedControl!
    @IBOutlet weak var searchCollectionView: UICollectionView!{
        didSet {
            searchCollectionView.dataSource = self
            searchCollectionView.delegate = self
            let nib = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
            searchCollectionView.register(nib, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        }
        
    }
    
    // MARK: - Init Attributes
    
       init(viewModel: SearchProductsViewModel) {
           self.viewModel = viewModel
           super.init(nibName: nil, bundle: nil)
       }
    
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let title = searchSegmentedControl.titleForSegment(at: searchSegmentedControl.selectedSegmentIndex)
        viewModel.fetchProducts(categorytext: title ?? "")
        
        viewModel.changeHandler = {
            change in
            switch change {
            case .didErrorOccurred(let error):
                print(error.localizedDescription)
            case .didFetchProduct:
                self.searchCollectionView.reloadData()
            }
        
        }
    }
    
}

// MARK: - Actions


//MARK: - Extensions
extension SearchProductsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            //viewModel.fetchProducts()
        }else{
            //viewModel.fetchProducts()
        }
    }
}

extension SearchProductsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: .screenWidth / 2 - 15.0, height: .screenWidth / 2 - 15.0)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            2
        }
    
    
    
}


