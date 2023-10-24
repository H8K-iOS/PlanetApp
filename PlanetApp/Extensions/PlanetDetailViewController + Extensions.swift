import UIKit
import SceneKit

//TODO: -
extension PlanetDetailViewController {
    func createCustomBarButton(imgName: String, selector: Selector) -> UIBarButtonItem {
        let btn = UIButton(type: .system)
        btn.setImage(
            UIImage(systemName: imgName)?.withRenderingMode(.alwaysTemplate),
            for: .normal)
        btn.tintColor = .gray
        btn.imageView?.contentMode = .scaleAspectFit
        btn.contentVerticalAlignment = .center
        btn.contentHorizontalAlignment = .center
        btn.backgroundColor = .darkGray.withAlphaComponent(0.3)
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
    
    func createNameLabel() -> UILabel {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "text"
        nameLabel.textColor = .white
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 60, weight: .light)
        return nameLabel
    }
    
    func createDescriptionLabel() -> UILabel {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "text"
        descriptionLabel.textColor = .darkGray
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = .systemFont(ofSize: 22, weight: .light)
        return descriptionLabel
    }
    
    func createDistanceFrmEarthLabel() -> UILabel {
        let distanceFrmEarthLabel = UILabel()
        distanceFrmEarthLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceFrmEarthLabel.text = "Distance from Earth"
        distanceFrmEarthLabel.textColor = .darkGray
        return distanceFrmEarthLabel
    }
    
    func createDistanceLabel() -> UILabel {
        let distanceLabel = UILabel()
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.text = "text"
        distanceLabel.textColor = . white
        distanceLabel.font = .systemFont(ofSize: 25, weight: .light)
        return distanceLabel
    }
    
    func createVStack() -> UIStackView {
        let vStack = UIStackView()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.alignment = .leading
        vStack.spacing = -7
        return vStack
    }
    
    func createDistanceLabelsVStack() -> UIStackView {
        let distanceLabelsVStack = UIStackView()
        distanceLabelsVStack.translatesAutoresizingMaskIntoConstraints = false
        distanceLabelsVStack.axis = .vertical
        distanceLabelsVStack.spacing = 0
        distanceLabelsVStack.alignment = .leading
        distanceLabelsVStack.distribution = .fill
        return distanceLabelsVStack
    }
    
    func createButtonHStack() -> UIStackView {
        let buttonHStack = UIStackView()
        buttonHStack.translatesAutoresizingMaskIntoConstraints = false
        buttonHStack.axis = .horizontal
        buttonHStack.spacing = 5
        return buttonHStack
    }
    
    func createDistanceHStack() -> UIStackView {
        let distanceHStack = UIStackView()
        distanceHStack.translatesAutoresizingMaskIntoConstraints = false
        distanceHStack.axis = .horizontal
        distanceHStack.alignment = .leading
        distanceHStack.spacing = 0
        distanceHStack.distribution = .equalSpacing
        return distanceHStack
    }
    
    func createSceneView() -> SCNView {
        let sceenV = SCNView()
        sceenV.backgroundColor = .clear
        sceenV.autoenablesDefaultLighting = true
        sceenV.allowsCameraControl = false
        sceenV.translatesAutoresizingMaskIntoConstraints = false
        sceenV.antialiasingMode = .multisampling2X
        return sceenV
    }
}

