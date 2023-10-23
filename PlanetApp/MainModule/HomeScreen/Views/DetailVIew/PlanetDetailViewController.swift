import UIKit
import SceneKit

final class PlanetDetailViewController: UIViewController {
    
    //MARK: - Variables
    private let viewModel: PlanetDetailViewModel
    private let vStack = UIStackView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let distanceLabelsVStack = UIStackView()
    private let distanceHStack = UIStackView()
    private let distanceFrmEarthLabel = UILabel()
    private let distanceLabel = UILabel()
    private let buttonHStack = UIStackView()
    private var isActive = false
        //TODO: -
    
    //MARK: - UIComponents
    private let sceneView: SCNView = {
        let sceenV = SCNView()
        sceenV.backgroundColor = .clear
        sceenV.autoenablesDefaultLighting = true
        sceenV.allowsCameraControl = false
        sceenV.translatesAutoresizingMaskIntoConstraints = false
        sceenV.antialiasingMode = .multisampling2X
        return sceenV
    }()
    
   // private let customCollectionView = UICollectionView()
    
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
        setLayouts()
        setPlanetData()
        planetRotation()
    }
    //MARK: - Functions
    @objc private func backBtnTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func shareBtnTapped() {
        print("shareButtonTapped")
    }
    
    @objc private func rotationPlanetBtnTapped() {
        if isActive {
            sceneView.allowsCameraControl = false
        } else {
            sceneView.allowsCameraControl = true
        }
        
        isActive = !isActive
    }
    
    @objc private func infoPlanetBtnTapped() {
        print("infoPlanetBtnTapped")
    }
}

//MARK: - Extensions
extension PlanetDetailViewController {
    //MARK: - Display Data
    private func setPlanetData() {
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
        distanceLabel.text = viewModel.distance + " Light year"
        
        if let scene = SCNScene(named: viewModel.planetSceneName ?? "") {
            sceneView.scene = scene
        }
    }

    //MARK: - Setup NavigationBar
    private func setNavigationBar() {
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.tintColor = .gray
        
        let backButton = createCustomBarButton(imgName: "arrow.left",
                                               tintColor: .white,
                                               backgroundColor: .darkGray,
                                               selector: #selector(backBtnTapped))
        
        let shareButton = createCustomBarButton(imgName: "square.and.arrow.up",
                                                tintColor: .gray,
                                                backgroundColor: .gray,
                                                selector: #selector(shareBtnTapped))
        
        navigationItem.rightBarButtonItems = [shareButton]
        navigationItem.leftBarButtonItem = backButton
    }
    
    //MARK: - Setup SCNView
    private func planetRotation() {
        let rotationAnimation = CABasicAnimation(keyPath: "rotation")
        rotationAnimation.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 2, z: 0, w: 10))
        rotationAnimation.duration = 100
        rotationAnimation.repeatCount = .infinity
        sceneView.scene?.rootNode.addAnimation(rotationAnimation, forKey: "rotation")
    }
    
    //MARK: - Setup Views
    private func setViews() {
        //MARK: - Views
        let rotationPlanetButton = createDistanteButton(imgName: "arrow.triangle.2.circlepath", selector: #selector(rotationPlanetBtnTapped))
        
        let infoPlanetButton = createDistanteButton(imgName: "questionmark", selector: #selector(infoPlanetBtnTapped))
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabelsVStack.translatesAutoresizingMaskIntoConstraints = false
        distanceHStack.translatesAutoresizingMaskIntoConstraints = false
        distanceFrmEarthLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonHStack.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = "text"
        nameLabel.textColor = .white
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 60, weight: .light)
    
        descriptionLabel.text = "text"
        descriptionLabel.textColor = .darkGray
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = .systemFont(ofSize: 22, weight: .light)
        
        distanceFrmEarthLabel.text = "Distance from Earth"
        distanceFrmEarthLabel.textColor = .darkGray
        
        distanceLabel.text = "text"
        distanceLabel.textColor = . white
        distanceLabel.font = .systemFont(ofSize: 25, weight: .light)
        
        vStack.axis = .vertical
        vStack.alignment = .leading
        vStack.spacing = -7
        
        distanceLabelsVStack.axis = .vertical
        distanceLabelsVStack.spacing = 0
        distanceLabelsVStack.alignment = .leading
        distanceLabelsVStack.distribution = .fill
        
        buttonHStack.axis = .horizontal
        buttonHStack.spacing = 5
        
        distanceHStack.axis = .horizontal
        distanceHStack.alignment = .leading
        distanceHStack.spacing = 0
        distanceHStack.distribution = .equalSpacing

    //MARK: - Hierarchy
        vStack.addArrangedSubview(nameLabel)
        vStack.addArrangedSubview(descriptionLabel)
        self.view.addSubview(sceneView)
        self.view.addSubview(vStack)
        
        distanceLabelsVStack.addArrangedSubview(distanceFrmEarthLabel)
        distanceLabelsVStack.addArrangedSubview(distanceLabel)
        distanceHStack.addArrangedSubview(distanceLabelsVStack)
        
        buttonHStack.addArrangedSubview(infoPlanetButton)
        buttonHStack.addArrangedSubview(rotationPlanetButton)
        
        distanceHStack.addArrangedSubview(buttonHStack)
        self.view.addSubview(distanceHStack)
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
            sceneView.heightAnchor.constraint(equalToConstant: 400),
    
            distanceHStack.topAnchor.constraint(equalTo: sceneView.bottomAnchor),
            distanceHStack.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            distanceHStack.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16),
        ])
    }

}




