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

final class HomeViewController: UIViewController, UISearchControllerDelegate {
    
    var sections = Section.allCases
    private var trendingNowRecipes: [Recipe] = []
    private var randomRecipes: [Recipe] = []
	private var typeRecipes: [Resulte] = []
    private var searchRecipes: [RecipeSearch] = []
    private var collectionView: UICollectionView!
	private let mealTypes = MealType.allCases
    private let searchController = UISearchController(searchResultsController: nil)

    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTrendinRecipes()
        fetchRandomRecipes()
		fetchMealTypeRecipe(mealType: "main%20course")
		
		print("TYPE RECIPE \(typeRecipes)")
		print("RANDOOOOOOM: \(randomRecipes)")
        
        //MARK: - NavController Home
        title = "Home"
        view.backgroundColor = .cyan
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.backButtonDisplayMode = .minimal
        
        setupCollectionView()
        setupSearchController()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        searchController.searchBar.delegate = self
        
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
    
    private func setupSearchController() {
        //searchController.searchResultsUpdater = self
        searchController.automaticallyShowsCancelButton = true
        searchController.searchBar.placeholder = "Search recipes"
        navigationItem.searchController = searchController
        
    }
    
	private func createCompositionalLayout() -> UICollectionViewLayout {
		let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
			guard let section = Section(rawValue: sectionIndex) else { fatalError() }
			
			switch section {
			case .trending:
				return self.createSection(groupWidth: 300, groupHeight: 220, header: [self.setupHeader()], behavior: .groupPaging)
			case .popularCategoryFilter:
				return self.createSection(groupWidth: 83, groupHeight: 34, header: [self.setupHeader()], behavior: .continuous)
			case .popular:
				return self.createSection(groupWidth: 150, groupHeight: 231, header: [], behavior: .groupPaging)
			case .recent:
				return self.createSection(groupWidth: 124, groupHeight: 175, header: [self.setupHeader()], behavior: .groupPaging)
			}
		}
		
		return layout
	}
    
	private func goToVC(with title: String) {
		let destinationVC = SeeAllViewController()
		destinationVC.title = title
		self.navigationController?.pushViewController(destinationVC, animated: true)
	}
	
	private func goToRecipeViewController(title: String, image: UIImage, steps: [AnalyzedInstruction]?) {
		let destinationVC = RecipeViewControllerScreen()
		destinationVC.configureImageTitle(image: image, title: title)
		destinationVC.steps = steps
		navigationController?.pushViewController(destinationVC, animated: true)
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
	
	private func setupHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
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
		
		header.buttonHeaderAction = { [weak self] title in
			guard let self = self else { return }
			self.goToVC(with: title ?? "")
		}
          return header
  }
    
    //MARK: - DispatchQueue

    private func fetchTrendinRecipes() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            APIManager.shared.fetchRandomRecipes(numberOfRecipes: 350) { result in
                switch result {
                case .success(let cookData):
                    let recipesWithImagesAndLikes = cookData.recipes.filter { recipe in
                        guard !recipe.title.isEmpty,
                              !recipe.extendedIngredients.isEmpty,
                              recipe.readyInMinutes > 0,
                              recipe.healthScore > 40 else {
                            return false
                        }
                        return true
                    }
                    self?.trendingNowRecipes = recipesWithImagesAndLikes
                    DispatchQueue.main.async {
                        self?.collectionView.reloadData()
                    }
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
    
    private func fetchRandomRecipes() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            APIManager.shared.fetchRandomRecipes(numberOfRecipes: 2) { result in
                switch result {
                case .success(let cookData):
                    self?.randomRecipes = cookData.recipes
                    DispatchQueue.main.async {
                        self?.collectionView.reloadData()
                    }
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
	
	private func fetchMealTypeRecipe(mealType: String) {
		DispatchQueue.global(qos: .userInitiated).async { [weak self] in
			APIManager.shared.fetchMealTypeRecipe(numberOfRecipes: 2, mealType: mealType) { result in
				switch result {
				case .success(let data):
					self?.typeRecipes = data.results
					DispatchQueue.main.async {
						let indexSet = IndexSet(integer: 2)
						self?.collectionView.reloadSections(indexSet)
					}
				case .failure(let error):
					print("Error:::: \(error)")
				}
			}
		}
	}
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sections[section] {
        case .trending:
            return trendingNowRecipes.count
        case .popularCategoryFilter:
			return mealTypes.count
        case .popular:
			return typeRecipes.count
        case .recent:
            return randomRecipes.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .trending:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! HomeViewControllerTrendingCell
            let recipe = trendingNowRecipes[indexPath.item]
            
            DispatchQueue.global(qos: .userInitiated).async {
                APIManager.shared.fetchRecipeImage(id: recipe.id) { image in
                    if let image = image {
                        cell.configureCell(title: recipe.title, imageName: image, rating: recipe.healthScore)
                    }
                }
            }
            return cell
        case .popularCategoryFilter:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId0", for: indexPath) as! HomeViewControllerFilterCell
			cell.configure(title: mealTypes[indexPath.row].rawValue)
			
			if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first, selectedIndexPath == indexPath {
				cell.configureCellSelect()
			} else {
				cell.configureCellDeselect()
			}
			
            return cell
        case .popular:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId1", for: indexPath) as! HomeViewControllerPopularCell 
			let recipe = typeRecipes[indexPath.item]

			DispatchQueue.global(qos: .userInitiated).async {
				APIManager.shared.fetchRecipeImage(id: recipe.id) { image in
					if let image = image {
						cell.configure(imageName: image, title: recipe.title, time: String(recipe.readyInMinutes))
					}
				}
			}
			
            return cell
        case .recent:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId2", for: indexPath) as! HomeViewControllerRecentRecipeCell
            let recipe = randomRecipes[indexPath.item]
            
            DispatchQueue.global(qos: .userInitiated).async {
                APIManager.shared.fetchRecipeImage(id: recipe.id) { image in
                    if let image = image {
                        cell.configure(imageName: image, title: recipe.title)
                    }
                }
            }
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
}

//MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		switch sections[indexPath.section] {
		case .trending:
			print("Section \(indexPath.section), cell: \(indexPath.row)")
			guard let cell = collectionView.cellForItem(at: indexPath) as? HomeViewControllerTrendingCell else { return }
			goToRecipeViewController(title: cell.getTitle(), image: cell.getImage(), steps: nil)
		case .popularCategoryFilter:
			print("Section \(indexPath.section), cell: \(indexPath.row)")
			if let cell = collectionView.cellForItem(at: indexPath) as? HomeViewControllerFilterCell {
				cell.configureCellSelect()
				let mealType = cell.getTitle()
				fetchMealTypeRecipe(mealType: mealType)
			}
		case .popular:
			print("Section \(indexPath.section), cell: \(indexPath.row)")
			guard let cell = collectionView.cellForItem(at: indexPath) as? HomeViewControllerPopularCell else { return }
			let recipe = typeRecipes[indexPath.item]
			let steps = recipe.analyzedInstructions
			
			goToRecipeViewController(title: cell.getTitle(), image: cell.getImage(), steps: steps)
		case .recent:
			print("Section \(indexPath.section), cell: \(indexPath.row)")
			guard let cell = collectionView.cellForItem(at: indexPath) as? HomeViewControllerRecentRecipeCell else { return }
			goToRecipeViewController(title: cell.getTitle(), image: cell.getImage(), steps: nil)
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
		if let cell = collectionView.cellForItem(at: indexPath) as? HomeViewControllerFilterCell {
			cell.configureCellDeselect()
		}
	}
}
//MARK: - UISearchBarDelegate Transition SearchViewController()

// MARK: - SearchResultUpdating
extension HomeViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let searchViewController = SearchRecipeViewController()
        self.navigationController?.pushViewController(searchViewController, animated: true)
        return false
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text != "" {
            print(text)
        }
    }
}
