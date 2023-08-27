//
//  OnboardingViewController.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 26.08.2023.
//

import UIKit

class OnboardingViewController: UIViewController {

    private let firstOnboardingScreen = OnboardingScreens()
    private let secondOnboardingScreen = OnboardingScreens()
    private let thirdOnboardingScreen = OnboardingScreens()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.contentInsetAdjustmentBehavior = .scrollableAxes
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "onboardingBackImage")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.preferredIndicatorImage = UIImage(named: "inactivePageIndicator")
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = .purple
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()

    private var slides = [OnboardingScreens]()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        slides = createSlides()
        setupSlidesScrollView(slides: slides)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrints()
        setDelegates()
        buttonsTapped()
    }

    private func setupViews() {
        view.backgroundColor = .red
        navigationController?.isNavigationBarHidden = true
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundImageView)
        view.addSubview(pageControl)
    }

    private func setDelegates() {
        scrollView.delegate = self
    }

    private func createSlides() -> [OnboardingScreens] {
        firstOnboardingScreen.setPageLabelText(text: "Recipes from all over the World")
        firstOnboardingScreen.hideDoneButton()

        secondOnboardingScreen.setPageLabelText(text: "Recipes with each and every detail")
        secondOnboardingScreen.hideDoneButton()
        secondOnboardingScreen.setLabelColor()

        thirdOnboardingScreen.setPageLabelText(text: "Cook it now or save it for later")
        thirdOnboardingScreen.hideSkipButton()
        thirdOnboardingScreen.setLabelColor()

        return [firstOnboardingScreen, secondOnboardingScreen, thirdOnboardingScreen]
    }

    private func setupSlidesScrollView(slides: [OnboardingScreens]) {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count),
                                        height: view.frame.height)

        for i in 0..<slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i),
                                     y: 0,
                                     width: view.frame.width,
                                     height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }

    func buttonsTapped() {
        firstOnboardingScreen.skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        secondOnboardingScreen.skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        thirdOnboardingScreen.doneButton.addTarget(self, action: #selector(doneButtonTapped(_:)), for: .primaryActionTriggered)
    }

    @objc func skipButtonTapped() {
//        secondOnboardingScreen.showAnimation {
            //go straight to login screen
//            let mainTabBarController = MainTabBarViewController()
//            if let navigator = self.navigationController {
//                navigator.pushViewController(MainViewController(), animated: true)
//            }
//        }
    }

    @objc func doneButtonTapped(_ sender: UIButton) {
//        sender.showAnimation {
//            //go straight to login screen
////            let mainTabBarController = MainTabBarViewController()
//            if let navigator = self.navigationController {
//                navigator.pushViewController(MainViewController(), animated: true)
//            }
//        }
    }
}
//MARK: - UIScrollViewDelegate
extension OnboardingViewController: UIScrollViewDelegate, UIPageViewControllerDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maxHOffset = scrollView.contentSize.width - view.frame.width
        let percentHOffset = scrollView.contentOffset.x / maxHOffset
        
        if percentHOffset <= 0.5 {
            let firstTransformation = CGAffineTransform(scaleX: (0.5 - percentHOffset) / 0.5,
                                                        y: (0.5 - percentHOffset) / 0.5)
            
            let secondTransformation = CGAffineTransform(scaleX: percentHOffset / 0.5,
                                                         y: percentHOffset / 0.5)
            
            slides[0].setPageLabelTransformWith(transform: firstTransformation)
            slides[1].setPageLabelTransformWith(transform: secondTransformation)
        } else {
            let secondTransformation = CGAffineTransform(scaleX: (1 - percentHOffset) / 0.5,
                                                          y: (1 - percentHOffset) / 0.5)
            let thirdTransformation = CGAffineTransform(scaleX: percentHOffset,
                                                        y: percentHOffset)
            
            slides[1].setPageLabelTransformWith(transform: secondTransformation)
            slides[2].setPageLabelTransformWith(transform: thirdTransformation)
        }
    }
}

//MARK: - Set Constraints
extension OnboardingViewController {
    private func setConstrints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),

            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),

            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            pageControl.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
