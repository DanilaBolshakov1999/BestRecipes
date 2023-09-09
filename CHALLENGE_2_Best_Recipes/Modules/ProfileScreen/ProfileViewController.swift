//
//  ProfileViewController.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Alexander Altman on 27.08.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    //MARK: - Elements
    private let profileimageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "profile")
        element.contentMode = .scaleAspectFill
        element.clipsToBounds = true
        element.layer.cornerRadius = 50
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let collectionHeader: UILabel = {
        let element = UILabel()
        element.text = "My Recipes"
        element.font = UIFont(name: Theme.Fonts.boldFont, size: 30)
        element.textAlignment = .left
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(SeeAllTrendingCell.self, forCellWithReuseIdentifier: Theme.trending)
        
        return collectionView
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setDelegates()
        setSonstraints()
        collectionView.reloadData()
    }
    
    //MARK: - Private Methods
   private func setDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func tapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(changeAvatar))
        profileimageView.isUserInteractionEnabled = true
        profileimageView.addGestureRecognizer(tap)
    }
    
    @objc private func changeAvatar() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    private func setViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "My Profile"
        view.backgroundColor = .white
        view.addSubview(profileimageView)
        view.addSubview(collectionHeader)
        view.addSubview(collectionView)
        tapGesture()
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Theme.trending, for: indexPath) as? SeeAllTrendingCell else {
            fatalError("Could not dequeue SeeAllTrendingCell")
        }
        if let dishImage = UIImage(named: "dishOne") {
			cell.configureCollectionCell(with: dishImage, describtion: "vegetable sauce at home", ingredients: "9 Ingredients", cookingTime: 25, rating: Int(5.0))
        }
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 200)
    }
}

//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profileimageView.image = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - Constraints
extension ProfileViewController {
    private func setSonstraints() {
        NSLayoutConstraint.activate([
            profileimageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            profileimageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profileimageView.heightAnchor.constraint(equalToConstant: 100),
            profileimageView.widthAnchor.constraint(equalToConstant: 100),
            
            collectionHeader.topAnchor.constraint(equalTo: profileimageView.bottomAnchor, constant: 40),
            collectionHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionHeader.heightAnchor.constraint(equalToConstant: 70),
            
            collectionView.topAnchor.constraint(equalTo: collectionHeader.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
