//
//  SearchRecipeViewController.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 12.09.2023.
//

import UIKit

class SearchRecipeViewController: UIViewController {
    
    private let networkManager = NetworkManager()
    private let urlGenerator = URLGenerate()
    private var searchedRecipe: [InformationSearchRecipe] = []
    private var searchWorkItem: DispatchWorkItem?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
