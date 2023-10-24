import UIKit

final class SliderScreenViewController: UIViewController {
    
    //MARK: - Variables
    private let viewModel: SliderViewModel
    private var pagers: [UIView] = []
    private var currentSlide = 0
    private var currentPageIndex: CGFloat = 0
    private var fromValue: CGFloat = 0
    private var widthAnchor: NSLayoutConstraint?
    private let shape = CAShapeLayer()
    private let taskShape = CAShapeLayer()
    private let animation = CABasicAnimation(keyPath: "strokeEnd")
    
    //MARK: - UI Components
    private lazy var collectionView = createCollectionView(cellClass: SliderCell.self, reuseIdentifier: SliderCell.identifire)
    private lazy var nextView = createNextView(selector: #selector(nextSlide))
    private lazy var skipButton = createSkipBtn(selector: #selector(skipButtonTapped))
    private lazy var hStack = createHStack()
    private lazy var vStack = createVStack()
    
    private lazy var pagerStack: UIStackView = {
        let pS = UIStackView()
        pS.axis = .horizontal
        pS.alignment = .center
        pS.spacing = 5
        pS.distribution = .fill
        pS.translatesAutoresizingMaskIntoConstraints = false
        
        for tag in 1...viewModel.sliderData.count {
            let pager = UIView()
            pager.tag = tag
            pager.translatesAutoresizingMaskIntoConstraints = false
            pager.backgroundColor = .white
            pager.layer.cornerRadius = 5
            pager.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(scrollSlide)))
            self.pagers.append(pager)
            pS.addArrangedSubview(pager)
        }
        
        return pS
    }()
    
    //MARK: - Life Cycle
    init(_ viewModel: SliderViewModel = SliderViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHierarchy()
        setLayouts()
        setShape()
    }
    
    //MARK: - Functions
    @objc private func skipButtonTapped() {
        self.dismiss(animated: true)
    }
    
    //MARK: Slides Settings
    @objc private func nextSlide() {
        let maxSlide = viewModel.sliderData.count
        if currentSlide < maxSlide - 1 {
            currentSlide += 1
            collectionView.scrollToItem(at: IndexPath(item: currentSlide,
                                                      section: 0),
                                        at: .centeredHorizontally,
                                        animated: true)
        } else if currentSlide == maxSlide - 1 {
            self.dismiss(animated: true)
        }
    }
    
    @objc private func scrollSlide(sender: UIGestureRecognizer) {
        if let index = sender.view?.tag {
            collectionView.scrollToItem(at: IndexPath(item: index - 1,
                                                      section: 0),
                                        at: .centeredHorizontally,
                                        animated: true)
            
            currentSlide = index - 1
        }
    }
    
    //MARK: Button Shape
    @objc private func setShape() {
        currentPageIndex = CGFloat(1) / CGFloat(viewModel.sliderData.count)
        let nextStroke = UIBezierPath(arcCenter: CGPoint(x: 25, y: 25.3), radius: 25, startAngle: -(.pi/2), endAngle: 5, clockwise: true)
        
        taskShape.path = nextStroke.cgPath
        taskShape.fillColor = shape.fillColor
        taskShape.lineWidth = shape.lineWidth
        taskShape.strokeColor = shape.strokeColor
        taskShape.opacity = 0.1
        nextView.layer.addSublayer(taskShape)
        
        shape.path = nextStroke.cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.white.cgColor
        shape.lineWidth = 3
        shape.lineCap = .round
        shape.strokeStart = 0
        shape.strokeEnd = 0
        
        nextView.layer.addSublayer(shape)
    }
}

//MARK: - VC Extensions
extension SliderScreenViewController {
    private func setHierarchy() {
        vStack.addArrangedSubview(pagerStack)
        vStack.addArrangedSubview(skipButton)
        hStack.addArrangedSubview(vStack)
        hStack.addArrangedSubview(nextView)
        self.view.addSubview(collectionView)
        self.view.addSubview(hStack)
    }
    
    private func setLayouts() {
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            hStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            hStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            hStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
}

//MARK: - Collection View Settings
extension SliderScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.sliderData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCell.identifire, for: indexPath) as? SliderCell else {
            fatalError("Unable to dequeue")
        }
        let sliderData = viewModel.sliderData[indexPath.row]
        cell.configCell(with: sliderData)
        return cell
    }
}

extension SliderScreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        currentSlide = indexPath.item
        
        //MARK: Pager Layout Changes
        pagers.forEach { page in
            let tag = page.tag
            page.constraints.forEach { const in
                page.removeConstraint(const)
            }
            
            let viewTag = indexPath.item + 1
            
            if viewTag == tag {
                page.layer.opacity = 1
                widthAnchor = page.widthAnchor.constraint(equalToConstant: 24)
            } else {
                page.layer.opacity = 0.5
                widthAnchor = page.widthAnchor.constraint(equalToConstant: 10)
            }
            
            widthAnchor?.isActive = true
            page.heightAnchor.constraint(equalToConstant: 10).isActive = true
        }
        
        //MARK: Shape Animation
        let currentIndex = currentPageIndex * CGFloat(indexPath.item + 1)
        animation.fromValue = fromValue
        animation.toValue = currentIndex
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animation.duration = 0.4
        shape.add(animation, forKey: "animation")
        
        fromValue = currentIndex
    }
}
