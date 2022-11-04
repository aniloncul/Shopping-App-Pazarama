//
//  MainTabBarController.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 31.10.2022.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        let productViewModel = ProductViewModel()
        let productViewController = ProductViewController(viewModel: productViewModel)
        productViewController.title = "Products"
        let productNavigationController = UINavigationController(rootViewController: productViewController)
        
        let searchViewController = SearchViewController()
        searchViewController.title = "Search"
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)
        
        let profileViewController = ProfileViewController()
        profileViewController.title = "Profile"
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)

        viewControllers = [productNavigationController,
                           searchNavigationController,
                           profileNavigationController]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        title = "Main Page"
    }
}
