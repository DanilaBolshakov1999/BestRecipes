//
//  OnboardingScreens.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Alexander Altman on 27.08.2023.
//

import UIKit

class OnboardingScreens: UIView {

    private lazy var pageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: Theme.Fonts.boldFont, size: 40)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.layer.backgroundColor = UIColor.red.cgColor
        button.setTitle("Continue", for: .normal)
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pageLabel)
        addSubview(doneButton)
        addSubview(skipButton)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setPageLabelText(text: NSAttributedString) {
        pageLabel.attributedText = text
    }
    
    public func setPageLabelTransformWith(transform: CGAffineTransform) {
        pageLabel.transform = transform
    }

//    public func setPageImage(image: UIImage) {
//        pageImage.image = image
//    }

    public func hideDoneButton() {
        doneButton.isHidden = true
    }

    public func hideSkipButton() {
        skipButton.isHidden = true
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            pageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            pageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            pageLabel.bottomAnchor.constraint(equalTo: doneButton.topAnchor, constant: -72),
            pageLabel.heightAnchor.constraint(equalToConstant: 144),
            
            skipButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            skipButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            skipButton.widthAnchor.constraint(equalToConstant: 100),
            skipButton.heightAnchor.constraint(equalToConstant: 30),

            doneButton.bottomAnchor.constraint(equalTo: skipButton.topAnchor, constant: -12),
            doneButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            doneButton.widthAnchor.constraint(equalToConstant: 193),
            doneButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}
