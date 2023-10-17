import UIKit

final class HomeViewCell: UITableViewCell {
    //MARK: - Variables
    static let identifier = "HomeCell"
    private(set) var planetData: PlanetData!
    
    //MARK: - UI Components
    let planetImg: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .white
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Name"
        lab.textColor = .white
        lab.font = .systemFont(ofSize: 32, weight: .medium)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    let descriptionLabel: UILabel = {
        let dl = UILabel()
        dl.text = "Description"
        dl.textColor = .gray
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
    public func configCell(with data: PlanetData) {
        self.planetData = data
        self.nameLabel.text = data.name
        self.descriptionLabel.text = data.description
        self.planetImg.image = UIImage(named: planetData?.imageName ?? "")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.planetImg.image = nil
        self.nameLabel.text = nil
        self.descriptionLabel.text = nil
    }
    
    //TODO: - Constraints
    private func setupUI() {
        labelStack.addArrangedSubview(nameLabel)
        labelStack.addArrangedSubview(descriptionLabel)
        self.addSubview(labelStack)
        self.addSubview(planetImg)
        
        NSLayoutConstraint.activate([
            planetImg.centerYAnchor.constraint(equalTo: centerYAnchor),
            planetImg.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            planetImg.widthAnchor.constraint(equalToConstant: 130),
            planetImg.heightAnchor.constraint(equalToConstant: 130),
            
            labelStack.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            labelStack.leftAnchor.constraint(equalTo: planetImg.rightAnchor, constant: 16),
            labelStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
    }
}
