//
//  TabBarViewController.swift
//  FlickerApiApp
//
//  Created by Berksu Kısmet on 16.10.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupViewControllers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    // Create all of the tabs and icons of the tabs
    func setupViewControllers(){
        let productViewModel = ProductViewModel()
        let searchViewModel = SearchProductsViewModel()
        
        viewControllers = [
            createNavigationController(for: ProductViewController(viewModel: productViewModel),
                                       title: NSLocalizedString("HomePage", comment: ""), image: UIImage(systemName: "house")!),
            createNavigationController(for: SearchProductsViewController(viewModel: searchViewModel),
                                       title: NSLocalizedString("Search", comment: ""),
                                       image: UIImage(systemName: "signpost.right")!),
            createNavigationController(for: ProfileViewController(),
                                       title: NSLocalizedString("Profile", comment: ""),
                                       image: UIImage(systemName: "person")!)
        ]
    }
    
    fileprivate func createNavigationController(for rootViewController: UIViewController,
                                                title: String,
                                                image: UIImage) -> UIViewController{
        // add navigation controller to each tab
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        navigationController.navigationBar.prefersLargeTitles = false
        navigationController.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "basket")!, style: .plain, target: self, action: #selector(goToBasket))
        rootViewController.navigationItem.title = title
        return navigationController
    }
    @objc func goToBasket() {
        
    }
    
}
