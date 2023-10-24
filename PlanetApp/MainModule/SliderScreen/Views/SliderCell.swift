import UIKit
import Lottie

final class SliderCell: UICollectionViewCell {
    
    //MARK: - Variables
    static let identifire = "SliderCell"
    private let lottieView = LottieAnimationView()
    private(set) var sliderData: SliderData!
    
    //MARK: - UI Components
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "Title"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.text = "Text"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var verticakStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, subTextLabel])
        sv.axis = .vertical
        sv.spacing = 18
        sv.alignment = .leading
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSlide()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    public func configCell(with data: SliderData) {
        self.sliderData = data
        self.titleLabel.text = data.tittle
        self.subTextLabel.text = data.subText
        self.animationSetup(animationName: data.animationName)
        self.backgroundColor = .gray.withAlphaComponent(0.1)
    }
    
    private func setSlide() {
        contentView.addSubview(verticakStackView)
        self.verticakStackView.addSubview(titleLabel)
        self.verticakStackView.addSubview(subTextLabel)
        
        
        NSLayoutConstraint.activate([
            verticakStackView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            verticakStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            verticakStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
        ])
    }
    
    public func animationSetup(animationName: String) {
        self.addSubview(lottieView)
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        lottieView.animation = LottieAnimation.named(animationName)
        lottieView.loopMode = .loop
        lottieView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            lottieView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lottieView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 40),
            lottieView.heightAnchor.constraint(equalToConstant: 400),
        ])
        
        lottieView.play()
    }
}
