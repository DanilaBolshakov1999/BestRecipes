//
//  OnboardingScreens.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Alexander Altman on 27.08.2023.
//

import UIKit

final class OnboardingScreens: UIView {
    
    //MARK: - Elements
    private lazy var pageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: Theme.Fonts.boldFont, size: 40)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.layer.backgroundColor = UIColor.redButton?.cgColor
        button.setTitle("Start Cooking", for: .normal)
        button.titleLabel?.font = UIFont(name: Theme.Fonts.boldFont, size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var skipButton: UIButton = {
        let button = UIButton()
        button.layer.backgroundColor = .none
        button.setTitle("Skip", for: .normal)
        button.titleLabel?.font = UIFont(name: Theme.Fonts.appFont, size: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pageLabel)
        addSubview(continueButton)
        addSubview(skipButton)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    //MARK: - Public Methods
    public func setPageLabelText(text: NSAttributedString) {
        pageLabel.attributedText = text
    }
    
    public func setPageLabelTransformWith(transform: CGAffineTransform) {
        pageLabel.transform = transform
    }
    
    public func hideContinueButton() {
        continueButton.isHidden = true
    }
    
    public func hideSkipButton() {
        skipButton.isHidden = true
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            pageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            pageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            pageLabel.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -72),
            pageLabel.heightAnchor.constraint(equalToConstant: 144),
            
            skipButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5),
            skipButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            skipButton.widthAnchor.constraint(equalToConstant: 100),
            skipButton.heightAnchor.constraint(equalToConstant: 30),
            
            continueButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5),
            continueButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            continueButton.widthAnchor.constraint(equalToConstant: 193),
            continueButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}
