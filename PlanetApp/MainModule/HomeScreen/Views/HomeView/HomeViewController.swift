import UIKit

final class HomeViewController: UIViewController {
    
    //MARK: - Variables
    private let firstLaunch = UserDefaults.standard.value(forKey: "firstLaunch") == nil
    private let tableView = UITableView()
    private let viewModel: HomeViewModel
    //MARK: - Life Cycle
    init(_ viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomeViewCell.self, forCellReuseIdentifier: HomeViewCell.identifier)
        
        setViews()
        setLayouts()
        ifFirstLaunch()
    }
    
    //MARK: - Functions
    private func ifFirstLaunch() {
        if firstLaunch {
            self.present(SliderScreenViewController(), animated: true)
            UserDefaults.standard.setValue(true, forKey: "firstLaunch")
        }
    }
}

//MARK: - Extensions
private extension HomeViewController {
    func setViews() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        self.view.backgroundColor = .black
        
        self.title = "Planets"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    func setLayouts() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - Table View Settings
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.planetData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.identifier, for: indexPath) as? HomeViewCell else { fatalError("fatal error") }
        let planet = self.viewModel.planetData[indexPath.row]
        cell.configCell(with: planet)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let planetData = viewModel.planetData[indexPath.row]
        let vm = PlanetDetailViewModel(planetData)
        let vc = PlanetDetailViewController(vm)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}
