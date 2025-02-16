//
//  HomeTabBarController.swift
//  Lets
//
//  Created by Нуридин Сафаралиев on 2/15/25.
//

import UIKit

class HomeTabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar(){
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .lightGray
        
        let homeController = HomeController()
        let profileController = ProfileControler()
        
        self.viewControllers = [
            generateVC(viewController: homeController, title: "Home", image: UIImage(systemName: "house.fill")),
            generateVC(viewController: profileController, title: "Profile",image: UIImage(systemName: "person.fill")),
            generateVC(viewController: profileController, title: "Profile",image: UIImage(systemName: "person.fill"))
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        viewController.title = title
        
        return navController
    }
    
    private func setTabBarAppearance(){
        let positionX:CGFloat = 30
        let positionY:CGFloat = 14
        let width = tabBar.bounds.width - positionX*2
        let height = tabBar.bounds.height + positionY*2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionX, y: tabBar.bounds.minY - positionY, width: width, height: height), cornerRadius: height/3.09)
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width/5
        tabBar.itemPositioning = .centered
        
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .lightGray
        roundLayer.fillColor = CGColor(red: 86/255, green: 86/255, blue: 219/255, alpha: 1)
    }
    
}
