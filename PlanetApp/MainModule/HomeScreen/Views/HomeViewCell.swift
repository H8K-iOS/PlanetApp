//
//  HomeViewCell.swift
//  PlanetApp
//
//  Created by Alexandr Alimov on 14/10/23.
//

import UIKit

class HomeViewCell: UITableViewCell {
    //MARK: - Variables
    static let identifier = "HomeCell"
    
    //MARK: - UI Components
    let planetImg: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .white
        iv.backgroundColor = .gray
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Name"
        lab.textColor = .white
        lab.font = .systemFont(ofSize: 24, weight: .medium)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    let descriptionLabel: UILabel = {
        let dl = UILabel()
        dl.text = "Description"
        dl.textColor = .white
        dl.font = .systemFont(ofSize: 20, weight: .medium)
        dl.translatesAutoresizingMaskIntoConstraints = false
        return dl
    }()
    
    let labelStack: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 1
        sv.axis = .vertical
        sv.alignment = . leading
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    //MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Function
    
    //TODO: - Constraints
    private func setupUI() {
        labelStack.addArrangedSubview(nameLabel)
        labelStack.addArrangedSubview(descriptionLabel)
        self.addSubview(labelStack)
        self.addSubview(planetImg)
        
        NSLayoutConstraint.activate([
            labelStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelStack.heightAnchor.constraint(equalToConstant: 50),

            planetImg.centerYAnchor.constraint(equalTo: centerYAnchor),
            planetImg.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            planetImg.widthAnchor.constraint(equalToConstant: 100),
            planetImg.heightAnchor.constraint(equalToConstant: 100)
            
        ])
    }
}
