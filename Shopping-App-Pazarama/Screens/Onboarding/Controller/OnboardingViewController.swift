import UIKit

final class OnboardingViewController: UIViewController {
    
    private let pageWidth: CGFloat = UIScreen.main.bounds.width
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var skipButton: UIButton!
    @IBOutlet private weak var prevButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    
    var currentPageNumber: Int = .zero {
        didSet {
            if currentPageNumber == onboardingViews.count - 1 {
                nextButton.setTitle("Finish", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
            
            if currentPageNumber == .zero {
                prevButton.isHidden = true
            } else {
                prevButton.isHidden = false
            }
            
            pageControl.currentPage = currentPageNumber
            updateScrollViewContentOffset(with: currentPageNumber)
        }
    }
    
    var onboardingViews = [OnboardingView]() {
        didSet {
            let numberOfPages = onboardingViews.count
                    
            scrollView.contentSize.width = CGFloat(numberOfPages) * pageWidth
            
            pageControl.numberOfPages = numberOfPages
            
            guard let onboardingView = onboardingViews.last else {
                fatalError("OnboardingView not found.")
            }
            contentView.addSubview(onboardingView)
            onboardingView.translatesAutoresizingMaskIntoConstraints = false
            
            if onboardingViews.count == 1 {
                NSLayoutConstraint.activate([
                    onboardingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    onboardingView.topAnchor.constraint(equalTo: contentView.topAnchor),
                    onboardingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                    onboardingView.widthAnchor.constraint(equalToConstant: pageWidth)
                ])
            } else  {
                
                NSLayoutConstraint.activate([
                    onboardingView.leadingAnchor.constraint(equalTo: onboardingViews[currentPageNumber].trailingAnchor),
                    onboardingView.topAnchor.constraint(equalTo: contentView.topAnchor),
                    onboardingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                    onboardingView.widthAnchor.constraint(equalToConstant: pageWidth),
                    onboardingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
                ])
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self

        navigationController?.setNavigationBarHidden(true, animated: false)
        
        let firstOnboardingView = OnboardingView()
        firstOnboardingView.image = UIImage(named: "pazarama.jpeg")
        firstOnboardingView.text = "If we drop the price of an item we sold you at any time before its scheduled delivery date, we will refund 100% of the difference, including tax."
        firstOnboardingView.headerText = "Best Prices Guaranteed"
        onboardingViews.append(firstOnboardingView)
        
          
        let secondOnboardingView = OnboardingView()
        secondOnboardingView.image = UIImage(named: "pazarama.jpeg")
        secondOnboardingView.text = "You can either pick your items from destinated areas or choose to be delivered at your addresse"
        secondOnboardingView.headerText = "Advanced Delivery System"
        onboardingViews.append(secondOnboardingView)
        
        
      //let thirdOnboardingView = OnboardingView()
      //thirdOnboardingView.image = UIImage(named: "pazarama.jpeg")
      //thirdOnboardingView.text = "Our payment tools allow users to pay you quickly and securely with customer portals, payment processing, and more."
      //thirdOnboardingView.headerText = "Fast and Secure Payment"
      //onboardingViews.append(thirdOnboardingView)
    }
    
    @IBAction func didTapNextButton(_ sender: UIButton) {
        if currentPageNumber < onboardingViews.count - 1 {
            currentPageNumber += 1
        } else {
            goToAuth()
        }
    }
    
    @IBAction func didTapPrevButton(_ sender: UIButton) {
        if currentPageNumber > 0 {
            currentPageNumber -= 1
        }
    }
    
    @IBAction func didTapSkipButton(_ sender: UIButton) {
        goToAuth()
    }
    
    @IBAction func didPageControlValueChanged(_ sender: UIPageControl) {
        updateScrollViewContentOffset(with: sender.currentPage)
    }
    
    private func updateScrollViewContentOffset(with pageNumber: Int) {
        let contentOffset = CGPoint(x: pageWidth * CGFloat(pageNumber), y: .zero)
        scrollView.setContentOffset(contentOffset, animated: true)
    }
    
    private func goToAuth() {
        //navigationController?.pushViewController(AuthViewController(viewModel: AuthViewModel()), animated: true)
        navigationController?.pushViewController(AuthViewController(viewModel: AuthViewModel()), animated: true)
    }
}

// MARK: - UIScrollViewDelegate
extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / pageWidth)
        currentPageNumber = currentPage
    }
}
