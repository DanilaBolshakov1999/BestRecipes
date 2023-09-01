//
//  RecipeViewControllerScreen.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 29.08.2023.
//

import UIKit
import SnapKit

final class RecipeViewControllerScreen: UIViewController, UITextViewDelegate {
    
    //MARK: - Table View
    
    private let tableView = UITableView()
    
    
    //MARK: - UI Private Properties + Extension
    
    //MARK:  Label
    private var labelHeaderOne = UILabel(title: "Instructions", backgroundColor: .clear)
    private var labelHeaderStack = UILabel(title: "Ingredients", backgroundColor: .clear)
    private var labelHeaderStackItem = UILabel(title: "5 items", backgroundColor: .clear)
    
    //MARK:  Stack
    private var stackMainView = UIStackView(backgroundColor: .gray)
    private var stackViewHeader = UIStackView(ingredient: .clear)
    private var stackViewOneCell = UIStackView(ingredient: .darkGray)
    
    //MARK: - UI
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = contentCize
        scrollView.frame = view.bounds
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.frame.size = contentCize
        return contentView
    }()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Theme.Fonts.boldFont, size: 24)
        label.text = Theme.mainView
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "recipeDetailImage")
        return image
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.text = Theme.textViewText
        textView.textColor = .black
        textView.isScrollEnabled = false
        return textView
    }()

    //MARK: - Private Property
    
    private var contentCize: CGSize {
        CGSize (width: view.frame .width, height: view.frame.height + 1000)
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavController()
        setDelegates()
        setViews()
        setConstrains()
    }
    
    //MARK: - Set Views
    
    private func setViews() {
        //tableView.backgroundColor = .
        tableView.register(RecipeCell.self, forCellReuseIdentifier: Theme.cellId)
        tableView.rowHeight = 120
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        
        //MARK: - Content Size
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + 1000)
        
        //MARK:  Add Main View
        view.addSubview(tableView)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackMainView)
        
        //MARK: - Stack Main View
        stackMainView.addArrangedSubview(mainLabel)
        stackMainView.addArrangedSubview(imageView)
        stackMainView.addArrangedSubview(labelHeaderOne)
        stackMainView.addArrangedSubview(textView)
        stackMainView.addArrangedSubview(stackViewHeader)
        stackMainView.addArrangedSubview(tableView)
        
        //MARK: - Stack Label
        stackViewHeader.addArrangedSubview(labelHeaderStack)
        stackViewHeader.addArrangedSubview(labelHeaderStackItem)
        
        tableView.isScrollEnabled = false
        
        textView.frame = view.bounds
        
    }
    
    //MARK: - Set Delegates
    
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK: - @objc Private Func
    
    @objc private func backButtonTapped() {
        navigationController?.pushViewController(OnboardingViewController(), animated: true)
    }
    
    @objc private func buttonTapped() {
        navigationController?.pushViewController(SeeAllViewController(), animated: true)
    }
    
    //MARK: - Struct
    
    struct CellItems {
        let image: String
        let nameItem: String
        let weightItem: String
    }
    
    let items = [
        CellItems(image: "ingredientsFirst", nameItem: "Fish", weightItem: "200g"),
        CellItems(image: "ingredientsSecond", nameItem: "Ginger", weightItem: "100g"),
        CellItems(image: "sunflowerOilThird", nameItem: "Vegetable Oli", weightItem: "80g"),
        CellItems(image: "ingredientsFourth", nameItem: "Salt", weightItem: "50g"),
        CellItems(image: "IngredientsFifth", nameItem: "Cucumber", weightItem: "200g")
    ]
}

extension RecipeViewControllerScreen {
    
    //MARK: - Configure Nav Controller
    
    private func configureNavController() {
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor(named: "purpleText") ?? .black
        ]
        
        let leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: Theme.backSwipe),
            style: .done, target: self,
            action: #selector(backButtonTapped)
        )
        
        let rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: Theme.moreSwipe),
            style: .done, target: self,
            action: #selector(buttonTapped)
        )
        
        leftBarButtonItem.tintColor = .black
        rightBarButtonItem.tintColor = .black
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        navigationController?.navigationBar.standardAppearance = appearance
    }
}


    //MARK: - UITableViewDataSource UITableViewDelegate

extension RecipeViewControllerScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Theme.cellId, for: indexPath) as? RecipeCell  else { fatalError() }
        let item = items[indexPath.row]
        cell.cellImage.image = UIImage(named: "ingredientsFirst")
        cell.nameItem.text = item.nameItem
        cell.weightItem.text = "\(item.weightItem) g"
        return cell
    }
}

    //MARK: - Set Constrains

extension RecipeViewControllerScreen {
    private func setConstrains() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackMainView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(contentView).inset(20)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        
        labelHeaderOne.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        
        textView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
    
        stackViewHeader.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.height.equalTo(600)
            make.leading.trailing.equalToSuperview()
        }
    }
}
