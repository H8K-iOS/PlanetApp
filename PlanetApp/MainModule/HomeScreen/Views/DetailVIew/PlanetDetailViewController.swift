import UIKit

final class PlanetDetailViewController: UIViewController {
    //MARK: - Variables
    private let viewModel: PlanetDetailViewModel
    
    
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
        
        setViews()
        displayPlanet()
    }
    //MARK: - Functions
    
}

//MARK: - Extensions
extension PlanetDetailViewController {
    private func setViews() {
        self.view.backgroundColor = .black
        
    }
    private func setLayouts() {
        
    }
    
    private func displayPlanet() {

    }
}
