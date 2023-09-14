//
//  SearchRecipeViewController.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 12.09.2023.
//

import UIKit
import Kingfisher

class SearchRecipeViewController: UIViewController {
    
    //MARK: - Private Properties
    
    private let networkManager = NetworkManager()
    private let urlGenerator = URLGenerate()
    private var searchedRecipe: [InformationSearchRecipe] = []
    private var searchWorkItem: DispatchWorkItem?
    
    //MARK: - UI
    
    private lazy var searchRecipesTableView: UITableView = {
        let tableView = UITableView()
        
        //MARK: Register
        tableView.register(SearchRecipeTableViewCell.self,
                           forCellReuseIdentifier: SearchRecipeTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = 250
        
        //MARK:  Delegate
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var searchRecipe: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Search Recipes"
        search.searchBar.delegate = self
        return search
    }()
    
    //MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchRecipe
        navigationItem.title = "Search Recipe"
    }
    
    private func setupUI() {
        view.addSubview(searchRecipesTableView)

        NSLayoutConstraint.activate([
            searchRecipesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            searchRecipesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchRecipesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchRecipesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func goToRecipeViewController(title: String, image: UIImage, steps: [AnalyzedInstruction]?) {
        let destinationVC = RecipeViewControllerScreen()
        destinationVC.configureImageTitle(image: image, title: title)
        destinationVC.steps = steps
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

extension SearchRecipeViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK:  Count number of Rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedRecipe.count
    }
    
    //MARK:  Cell For Row At table cell display settings
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchRecipeTableViewCell.identifier, for: indexPath) as! SearchRecipeTableViewCell
        cell.selectionStyle = .none
        cell.configure(image: searchedRecipe[indexPath.row].image, title: searchedRecipe[indexPath.row].title)
        return cell
    }
    
    //MARK: Did Select Row At
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentIndexPath = searchedRecipe[indexPath.row]

        guard let imageUrl = URL(string: currentIndexPath.image) else {
            return
        }

        let imageView = UIImageView()
        imageView.kf.setImage(with: imageUrl) { result in
            switch result {
            case .success(let imageResult):
                let loadedImage = imageResult.image
                let request = self.urlGenerator.request(endpoint: "recipes/" + "\(currentIndexPath.id)/analyzedInstructions")
                self.networkManager.request(generator: request) { (result: Swift.Result<[AnalyzedInstruction], Error>) in
                    switch result {
                    case .success(let searched):
                        self.goToRecipeViewController(title: currentIndexPath.title, image: loadedImage, steps: searched)
                    case .failure(let failure):
                        print(failure.localizedDescription)
                    }
                }
            case .failure(let error):
                print("Error loading image: \(error)")
            }
        }
    }
}


//MARK: - Search Recipe View Controller

extension SearchRecipeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchWorkItem?.cancel()
        
        let workItem = DispatchWorkItem { [weak self] in
            guard let self = self else { return }
            
            if let text = searchBar.text, !text.isEmpty {
                let request = self.urlGenerator.request(endpoint: "recipes/complexSearch", queryItems: [URLQueryItem(name: "query", value: text), URLQueryItem(name: "addRecipeInformation", value: "true")])
                
                self.networkManager.request(generator: request) { (result: Swift.Result<SearchRecipe, Error>) in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let searched):
                            self.searchedRecipe = searched.results
                            self.searchRecipesTableView.reloadData()
                        case .failure(let failure):
                            print(failure.localizedDescription)
                        }
                    }
                }
            }
        }
        searchWorkItem = workItem
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: workItem)
    }
}
