//
//  RecipeViewControllerScreen.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 29.08.2023.
//

import UIKit
import SnapKit

final class RecipeViewControllerScreen: UIViewController {
    
    //MARK: - Table View
    
    private let tableView = UITableView()

    //MARK: - Model
    
    var messages = Message.getMassage()
    
    //MARK: - UI Private Properties + Extension
    
    private var labelHeaderOne = UILabel(title: "Instructions", backgroundColor: .clear)
    private var labelHeader = UITextView(title: Theme.textViewText, backgroundColor: .cyan)
    private var labelHeaderTwo = UILabel(title: "Instructions", backgroundColor: .clear)

    //MARK: - UI
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .brown
        scrollView.contentSize = contentCize
        scrollView.frame = view.bounds
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .clear
        contentView.frame.size = contentCize
        return contentView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle(rawValue: Theme.Fonts.appFont))
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = Theme.mainView
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Theme.videoScreen)
        return image
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle(rawValue: Theme.Fonts.appFont))
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = Theme.textViewText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: - Private Property
    
    private var contentCize: CGSize {
        CGSize (width: view.frame .width, height: view.frame.height + 1000)
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavController()
        setDelegates()
        setViews()
        setConstrains()
    }
    
    //MARK: - Set Views
    
    private func setViews() {
        tableView.backgroundColor = .brown
        tableView.register(MessageCell.self , forCellReuseIdentifier: Theme.cellIdentifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + 1000)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(mainLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(labelHeaderOne)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(labelHeaderTwo)
    }
    
    //MARK: - Set Delegates
    
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK: - @objc Private Func
    
    @objc private func backButtonTapped() {
        navigationController?.pushViewController(SeeAllViewController(), animated: true)
    }
    
    @objc private func buttonTapped() {
        navigationController?.pushViewController(SeeAllViewController(), animated: true)
    }
}

extension RecipeViewControllerScreen {
    
    //MARK: - Configure Nav Controller
    
    private func configureNavController() {
        
        title = "Description of the dish"
        
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
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Theme.cellIdentifier, for: indexPath) as? MessageCell else { fatalError() }
        let model = messages[indexPath.row]
        cell.configure(with: model)
        cell.textLabel?.text = "Some text"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

    //MARK: - Set Constrains

extension RecipeViewControllerScreen {
    private func setConstrains() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(contentView)
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
        
//        label.snp.makeConstraints { make in
//            make.leading.trailing.equalToSuperview()
//        }
//
//        labelHeaderTwo.snp.makeConstraints { make in
//            make.leading.trailing.equalToSuperview()
//        }
    }
}
