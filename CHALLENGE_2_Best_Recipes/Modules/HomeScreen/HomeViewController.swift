//
//  HomeViewController.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Alexander Altman on 27.08.2023.
//

import UIKit

enum Section: Int, CaseIterable {
	case trending
	case popularCategoryFilter
	case popular
	case recent
	
	var title: String {
		switch self {
		case .trending:
			return "Trending now 🔥"
		case .popularCategoryFilter:
			return "Popular category"
		case .popular:
			return ""
		case .recent:
			return "Recent recipe"
		}
	}
}

final class HomeViewController: UIViewController {
	
	var sections = Section.allCases
	
	private var collectionView: UICollectionView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Home"
		view.backgroundColor = .cyan
		
		setupCollectionView()

		collectionView.delegate = self
		collectionView.dataSource = self
		
	}
	
	private func setupCollectionView() {
		collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
		collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		collectionView.backgroundColor = .white
		view.addSubview(collectionView)
		
		collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseId)
		collectionView.register(HomeViewControllerTrendingCell.self, forCellWithReuseIdentifier: "cellId")
		collectionView.register(HomeViewControllerFilterCell.self, forCellWithReuseIdentifier: "cellId0")
		collectionView.register(HomeViewControllerPopularCell.self, forCellWithReuseIdentifier: "cellId1")
		collectionView.register(HomeViewControllerRecentRecipeCell.self, forCellWithReuseIdentifier: "cellId2")
	}
	
	private func createCompositionalLayout() -> UICollectionViewLayout {
		let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
			guard let section = Section(rawValue: sectionIndex) else { fatalError() }
			
			switch section {
			case .trending:
				return self.createSection(groupWidth: 300, groupHeight: 220, header: [self.setupHeader()], behavior: .paging)//self.createTrendingRecipes()
			case .popularCategoryFilter:
				return self.createSection(groupWidth: 83, groupHeight: 34, header: [self.setupHeader()], behavior: .continuous)
			case .popular:
				return self.createSection(groupWidth: 150, groupHeight: 231, header: [], behavior: .paging)//self.createPopularCategory()
			case .recent:
				return self.createSection(groupWidth: 124, groupHeight: 175, header: [self.setupHeader()], behavior: .paging)//self.createRecentRecipe()
			}
		}
		
		return layout
	}
	
	private func createSection(groupWidth: CGFloat, groupHeight: CGFloat, header: [NSCollectionLayoutBoundarySupplementaryItem], behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior) -> NSCollectionLayoutSection {
		let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		
		let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(groupWidth), heightDimension: .absolute(groupHeight))
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
		
		let section = NSCollectionLayoutSection(group: group)
		section.interGroupSpacing = 16
		section.contentInsets = NSDirectionalEdgeInsets.init(top: 5, leading: 20, bottom: 16, trailing: 20)
		section.orthogonalScrollingBehavior = behavior//.groupPaging
		section.boundarySupplementaryItems = header
		return section
	}
	
	func setupHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
		let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30))
		let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
		
		return sectionHeader
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseId, for: indexPath) as! SectionHeader
		if indexPath.section == 1 || indexPath.section == 2 {
			header.configure(titleText: sections[indexPath.section].title, hideButton: true)
		} else {
			header.configure(titleText: sections[indexPath.section].title, hideButton: false)
		}
		return header
	}
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if section == 0 {
			return 10
		} else if section == 1 {
			return 10
		} else if section == 2 {
			return 7
		} else if section == 3 {
			return 9
		}
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		switch sections[indexPath.section] {
		case .trending:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! HomeViewControllerTrendingCell
			return cell
		case .popularCategoryFilter:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId0", for: indexPath) as! HomeViewControllerFilterCell
			return cell
		case .popular:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId1", for: indexPath) as! HomeViewControllerPopularCell //HomeViewControllerPopularCell
//			cell.configure(title: sections[indexPath.row].title)
			return cell
		case .recent:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId2", for: indexPath) as! HomeViewControllerRecentRecipeCell
			return cell
		}
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return sections.count
	}
}

extension HomeViewController: UICollectionViewDelegate {
	
}
