import UIKit

extension SliderScreenViewController {
    
    func createCollectionView(cellClass: AnyClass?, reuseIdentifier: String) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(cellClass, forCellWithReuseIdentifier: reuseIdentifier)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isPagingEnabled = true
        return cv
        
    }
    
    func createSkipBtn(selector: Selector) -> UIButton {
        let btn = UIButton()
        btn.setTitle("Skip", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.addTarget(self, action: selector, for: .touchUpInside)
        return btn
    }
    
    func createHStack() -> UIStackView {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .leading
        sv.spacing = 0
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }
    
    func createVStack() -> UIStackView {
        let sv = UIStackView()
        sv.backgroundColor = .clear
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = -5
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }
    
    func createNextView(selector: Selector) -> UIView {
        let tapGesture = UITapGestureRecognizer(target: self, action: selector)
        
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
    }
}
