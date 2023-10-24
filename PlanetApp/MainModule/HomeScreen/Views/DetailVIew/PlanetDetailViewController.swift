import UIKit
import SceneKit

final class PlanetDetailViewController: UIViewController {
    
    //MARK: - Variables
    private let viewModel: PlanetDetailViewModel
    private var isActive = false
    
    //MARK: - UIComponents
    private lazy var nameLabel = createNameLabel()
    private lazy var descriptionLabel = createDescriptionLabel()
    private lazy var distanceLabel = createDistanceLabel()
    private lazy var distanceFrmEarthLabel = createDistanceFrmEarthLabel()
    private lazy var vStack = createVStack()
    private lazy var distanceLabelsVStack = createDistanceLabelsVStack()
    private lazy var buttonHStack = createButtonHStack()
    private lazy var distanceHStack = createDistanceHStack()
    private lazy var sceneView = createSceneView()
    
    private lazy var rotationPlanetButton = createDistanteButton(imgName: "arrow.triangle.2.circlepath",
                                                                 selector: #selector(rotationPlanetBtnTapped)
    )
    
    private lazy var infoPlanetButton = createDistanteButton(imgName: "questionmark",
                                                             selector: #selector(infoPlanetBtnTapped)
    )
    
    private lazy var backButton = createCustomBarButton(imgName: "arrow.left",
                                                        selector: #selector(backBtnTapped)
    )
    
    private lazy var shareButton = createCustomBarButton(imgName: "square.and.arrow.up",
                                                         selector: #selector(shareBtnTapped)
    )
    
    //TODO: -
    lazy private var collectionView: UICollectionView = {
        //        let layout = UICollectionViewFlowLayout()
        //        layout.itemSize = CGSize(width: 50, height: 50)
        //        layout.minimumLineSpacing = 0
        //        layout.minimumInteritemSpacing = 0
        //        layout.scrollDirection = .horizontal
        //
        let cv = UICollectionView()
        //        cv.delegate = self
        //        cv.dataSource = self
        //        cv.backgroundColor = .cyan
        //        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        //        cv.showsHorizontalScrollIndicator = false
        //        cv.translatesAutoresizingMaskIntoConstraints = false
        //        cv.isPagingEnabled = true
        return cv
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
        setHierarchy()
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
    //MARK: Display Data
    private func setPlanetData() {
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
        distanceLabel.text = viewModel.distance + " Light year"
        
        if let scene = SCNScene(named: viewModel.planetSceneName ?? "") {
            sceneView.scene = scene
        }
    }
    
    //MARK: Setup NavigationBar
    private func setNavigationBar() {
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.tintColor = .gray
        navigationItem.rightBarButtonItems = [shareButton]
        navigationItem.leftBarButtonItem = backButton
    }
    
    //MARK:  Setup Planet Rotation
    private func planetRotation() {
        let rotationAnimation = CABasicAnimation(keyPath: "rotation")
        rotationAnimation.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 2, z: 0, w: 20))
        rotationAnimation.duration = 500
        rotationAnimation.repeatCount = .infinity
        sceneView.scene?.rootNode.addAnimation(rotationAnimation, forKey: "rotation")
    }
    
    //MARK: - Setup Views
    
    //MARK: Hierarchy
    private func setHierarchy() {
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
        //self.view.addSubview(collectionView)
    }
    
    //MARK: Layouts
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
            
            //            collectionView.topAnchor.constraint(equalTo: distanceHStack.bottomAnchor, constant: 5),
            //            collectionView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            //            collectionView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            //            collectionView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

//MARK: - CollectionView DataSource
//extension PlanetDetailViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//    
//}


