import UIKit

//TODO: -
extension PlanetDetailViewController {
    func createCustomBarButton(imgName: String, tintColor: UIColor, backgroundColor: UIColor, selector: Selector) -> UIBarButtonItem {
        let btn = UIButton(type: .system)
        btn.setImage(
            UIImage(systemName: imgName)?.withRenderingMode(.alwaysTemplate),
            for: .normal)
        btn.tintColor = tintColor
        btn.imageView?.contentMode = .scaleAspectFit
        btn.contentVerticalAlignment = .center
        btn.contentHorizontalAlignment = .center
        btn.backgroundColor = backgroundColor.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 15
        btn.frame = CGRect(x: 0, y: 0, width: 42, height: 42)
        btn.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: btn)
        return menuBarItem
    }
    
    func createDistanteButton(imgName: String, selector: Selector) -> UIButton{
        let btn = UIButton()
        btn.setImage(UIImage(systemName: imgName)?.withRenderingMode(.alwaysTemplate),
                     for: .normal)
        btn.contentVerticalAlignment = .center
        btn.contentHorizontalAlignment = .center
        btn.tintColor = .white
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 25
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.gray.withAlphaComponent(0.4).cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btn.addTarget(self, action: selector, for: .touchUpInside)
        return btn
    }
}

