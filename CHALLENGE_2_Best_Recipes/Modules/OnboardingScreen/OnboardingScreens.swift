//
//  OnboardingScreens.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Alexander Altman on 27.08.2023.
//

import UIKit

class OnboardingScreens: UIView {

    private let pageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let doneButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.backgroundColor = UIColor.red.cgColor
        button.setTitle("Done", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let skipButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.backgroundColor = UIColor.cyan.cgColor
        button.setTitle("Skip", for: .normal)
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

    public func setPageLabelText(text: String) {
        pageLabel.text = text
    }
    
    public func setPageLabelTransformWith(transform: CGAffineTransform) {
        pageLabel.transform = transform
    }

//    public func setPageImage(image: UIImage) {
//        pageImage.image = image
//    }

    public func setLabelColor() {
        pageLabel.textColor = .green
    }

    public func hideDoneButton() {
        doneButton.isHidden = true
    }

    public func hideSkipButton() {
        skipButton.isHidden = true
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([

            pageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            pageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            pageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            pageLabel.heightAnchor.constraint(equalToConstant: 100),

            doneButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            doneButton.widthAnchor.constraint(equalToConstant: 100),
            doneButton.heightAnchor.constraint(equalToConstant: 30),

            skipButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            skipButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            skipButton.widthAnchor.constraint(equalToConstant: 100),
            skipButton.heightAnchor.constraint(equalToConstant: 30),

        ])
    }
}

// extension UIView {
//    func showAnimation(_ completionBlock: @escaping () -> Void) {
//      isUserInteractionEnabled = false
//        UIView.animate(withDuration: 0.1,
//                       delay: 0,
//                       options: .curveLinear,
//                       animations: { [weak self] in
//                            self?.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
//        }) {  (done) in
//            UIView.animate(withDuration: 0.1,
//                           delay: 0,
//                           options: .curveLinear,
//                           animations: { [weak self] in
//                                self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
//            }) { [weak self] (_) in
//                self?.isUserInteractionEnabled = true
//                completionBlock()
//            }
//        }
//    }
//}
