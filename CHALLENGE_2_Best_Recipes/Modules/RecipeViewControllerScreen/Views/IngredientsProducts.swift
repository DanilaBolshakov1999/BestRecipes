//
//  Messege Call.swift
//  FlashChat-Code
//
//  Created by iOS - Developer on 19.08.2023.
//

import UIKit

class MessageCell: UITableViewCell {
    
    //MARK: - Element
    
    private lazy var mainStackViews: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.contentMode = .scaleToFill
        stack.distribution = .fill
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var leftImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ingredientsFive")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    private lazy var rightImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ingredientsFive")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var messageView: UIView = {
        let label = UIView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        messageView.layoutIfNeeded()
        messageView.frame = contentView.bounds
        messageView.layer.cornerRadius = messageView.frame.size.height / 4
    }
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public Properties
    
    public func configure(with model: Message) {
        switch model.sender {
        case .me:
            leftImageView.isHidden = true
            rightImageView.isHidden = false
            messageView.backgroundColor = UIColor(named: Theme.brownColor)
            messageLabel.textColor = UIColor(named: Theme.brownColor)
            
        case .you:
            leftImageView.isHidden = true
            rightImageView.isHidden = false
            messageView.backgroundColor = UIColor(named: Theme.brownColor)
            messageLabel.textColor = UIColor(named: Theme.brownColor)
        }
        messageLabel.text = model.body
    }
    
    //MARK: - Set Views
    private func setViews() {
        addSubview(mainStackViews)
        mainStackViews.addArrangedSubview(leftImageView)
        mainStackViews.addArrangedSubview(messageView)
        mainStackViews.addArrangedSubview(rightImageView)
        messageView.addSubview(messageLabel)
    }
}

//MARK: - Setup Constrains

extension MessageCell {
    private func setupConstrains() {
        mainStackViews.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.height.equalToSuperview().inset(10)
            make.centerX.centerY.equalTo(mainStackViews)
        }
        
        leftImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        
        rightImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
    }
}
