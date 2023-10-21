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
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(SliderCell.self, forCellWithReuseIdentifier: SliderCell.identifire)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isPagingEnabled = true
        return cv
    }()
    
    lazy var skipBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Skip", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var hStack: UIStackView = {
        var sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .leading
        sv.spacing = 0
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var vStack: UIStackView = {
        var sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = -5
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var nextView: UIView = {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(nextSlide))
        
        let nextImg = UIImageView()
        nextImg.image = UIImage(systemName: "chevron.right.circle.fill")
        nextImg.tintColor = .white
        nextImg.contentMode = .scaleAspectFit
        nextImg.translatesAutoresizingMaskIntoConstraints = false
        
        nextImg.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nextImg.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 50).isActive = true
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
        view.addSubview(nextImg)
        
        nextImg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextImg.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
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
        
        setupCollectionView()
        setControll()
        setShape()
    }
    
    //MARK: - Functions
    
    @objc private func skipButtonTapped() {
        self.dismiss(animated: true)
    }
    
    @objc private func nextSlide() {
        let maxSlide = viewModel.sliderData.count
        if currentSlide < maxSlide - 1 {
            currentSlide += 1
            collectionView.scrollToItem(at: IndexPath(item: currentSlide, section: 0), at: .centeredHorizontally, animated: true)
        } else if currentSlide == maxSlide - 1 {
            self.dismiss(animated: true)
        }
    }
    
    @objc private func scrollSlide(sender: UIGestureRecognizer) {
        if let index = sender.view?.tag {
            collectionView.scrollToItem(at: IndexPath(item: index - 1, section: 0), at: .centeredHorizontally, animated: true)
            
            currentSlide = index - 1
        }
    }
    
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
    //MARK: - Custom Pager
    private func setControll() {
        view.addSubview(hStack)
        
        let pagerStack = UIStackView()
        pagerStack.axis = .horizontal
        pagerStack.alignment = .center
        pagerStack.spacing = 5
        pagerStack.distribution = .fill
        pagerStack.translatesAutoresizingMaskIntoConstraints = false
        
        for tag in 1...viewModel.sliderData.count {
            let pager = UIView()
            pager.tag = tag
            pager.translatesAutoresizingMaskIntoConstraints = false
            pager.backgroundColor = .white
            pager.layer.cornerRadius = 5
            pager.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(scrollSlide)))
            self.pagers.append(pager)
            pagerStack.addArrangedSubview(pager)
        }
        vStack.addArrangedSubview(pagerStack)
        vStack.addArrangedSubview(skipBtn)
        hStack.addArrangedSubview(vStack)
        hStack.addArrangedSubview(nextView)
        
        NSLayoutConstraint.activate([
            hStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            hStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            hStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - Collection View Settings
extension SliderScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        currentSlide = indexPath.item
        
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
        
        //MARK: - Shape Animation
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
