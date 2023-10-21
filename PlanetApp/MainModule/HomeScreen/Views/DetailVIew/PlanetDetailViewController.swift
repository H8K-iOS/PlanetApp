import UIKit
import SceneKit

final class PlanetDetailViewController: UIViewController {
    //MARK: - Variables
    private let viewModel: PlanetDetailViewModel
    private let vStack = UIStackView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let sceneView = SCNView()
    private let distanceVStack = UIStackView()
    private let distanceHStack = UIStackView()
    private let distanceLabel = UILabel()
    
    //TODO: -
    
   // private let customCollectionView = UICollectionView()
    
    //MARK: - UI Components
    private var showPlanetButton: UIButton = {
        let btn = UIButton()
        
        return btn
    }()
    private var turnPlanetbutton: UIButton = {
        let btn = UIButton()
        
        return btn
    }()
    
    private lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 42, height: 42)
        btn.backgroundColor = .darkGray
        btn.layer.cornerRadius = 15
        btn.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        btn.tintColor = .white
        
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return btn
    }()

    //MARK: - Life Cycle
    init(_ viewModel: PlanetDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        
        setNavigationBar()
        setViews()
        setHierarchy()
        setLayouts()
        setSceneView()
        setPlanetData()
        
    }
    //MARK: - Functions
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
}

//MARK: - Extensions
extension PlanetDetailViewController {
    //MARK: - Display Data
    private func setPlanetData() {
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
    }

    //MARK: - Setup NAvigationBar
    private func setNavigationBar() {
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.tintColor = .gray
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
    
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
    }
    
    //MARK: - Setup SCNView
    func setSceneView() {
        sceneView.backgroundColor = .clear
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        sceneView.translatesAutoresizingMaskIntoConstraints = false
        
        if let scene = SCNScene(named: viewModel.planetSceneName ?? "mars3d") {
            sceneView.scene = scene
        }
    }
    
    //MARK: - Setup Views
    private func setViews() {
        vStack.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = "text"
        nameLabel.textColor = .white
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 60, weight: .light)
    
        descriptionLabel.text = "text"
        descriptionLabel.textColor = .darkGray
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = .systemFont(ofSize: 22, weight: .light)
        
        vStack.axis = .vertical
        vStack.alignment = .leading
        vStack.spacing = -7
        
    }
    
    //MARK: - Hierarchy
    private func setHierarchy() {
        vStack.addArrangedSubview(nameLabel)
        vStack.addArrangedSubview(descriptionLabel)
        self.view.addSubview(sceneView)
        self.view.addSubview(vStack)
    }
    
    //MARK: - Layouts
    private func setLayouts() {
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 105),
            vStack.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            vStack.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            
            sceneView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sceneView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            sceneView.widthAnchor.constraint(equalToConstant: 400),
            sceneView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }

}


