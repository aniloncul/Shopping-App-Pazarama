 //
//  AuthViewController.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 29.10.2022.
//

import UIKit
import FirebaseAuth

final class AuthViewController: UIViewController, AlertPresentable {
    
    private let viewModel: AuthViewModel
 //MARK: - Properties
    
    enum PageType: String {
        case login = "Login"
        case signUp = "Sign Up"
        
        init(text: String) {
            switch text {
            case "Login":
                self = .login
            case "Sign Up":
                self = .signUp
            default:
                self = .login
            }
        }
    }
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordConfirmationLabel: UILabel!
    @IBOutlet weak var passwordConfirmationTF: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var button: UIButton!
    
    //MARK: - Init
    
    init(viewModel: AuthViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsFor(pageType: .login)
        button.titleLabel?.text = "Login"
        mainLabel.text = "Sign In"
    }
    
    
    

    
    
    private var currentPageType: PageType = .login {
        didSet {
            setupViewsFor(pageType: currentPageType)
        }
    }
    
    private func setupViewsFor(pageType: PageType) {
        
        usernameLabel.isHidden = pageType == .login
        usernameTF.isHidden = pageType == .login
        passwordConfirmationLabel.isHidden = pageType == .login
        passwordConfirmationTF.isHidden = pageType == .login
    }
    
    
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        currentPageType = sender.selectedSegmentIndex == 0 ? .login : .signUp
        button.titleLabel!.text = (currentPageType == .login) ? "Login" : "Sign Up"
        mainLabel!.text = (currentPageType == .login) ? "Sign In" : "Register"
        
        
    }
    
    
    @IBAction func didButtonTapped(_ sender: UIButton) {
        //navigationController?.pushViewController(MainTabBarController(), animated: true)
        guard let email = emailTF.text,
              let password = passwordTF.text else {return}
        
        switch currentPageType  {
        case .login:
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                if let error = error {
                    self?.showError(error)
                    return
                }
                self?.navigationController?.pushViewController(MainTabBarController(), animated: true)
            }
        case .signUp:
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    self.showError(error)
                    return
                }
                if (self.usernameTF.text == "") {
                    self.showAlert(title: "Missing Username", message: "You must enter valid username.")
                }
                    else if (self.passwordTF.text == self.passwordConfirmationTF.text) {
                        self.showAlert(title: "Success", message: "You are registered") }
                    
        
                }
                
            }   
            //
            // }
            
        }
        
    }

