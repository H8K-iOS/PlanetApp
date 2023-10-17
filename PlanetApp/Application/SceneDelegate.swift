import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let isFirstLaunch = UserDefaults.standard.object(forKey: "firstLaunch") == nil
        
        if isFirstLaunch {
            window?.rootViewController = SliderScreenViewController()
            UserDefaults.standard.set(true, forKey: "firstLaunch")
        } else {
            window?.rootViewController = UINavigationController(rootViewController: HomeViewController())
        }
        window?.makeKeyAndVisible()
    }
}

