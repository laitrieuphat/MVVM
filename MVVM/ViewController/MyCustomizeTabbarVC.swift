//
//  MyCustomizeTabbarVC.swift
//  MVVM
//
//  Created by Minh on 15/9/25.
//

import Foundation
import UIKit

class MyCustomizeTabbarVC:UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setup tabbar controller
        tabBar.tintColor = .label
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        self.viewControllers = [
            createNavigationController(for: UserListViewController(), title: "UserList", image: UIImage(systemName: "person")!),
            createNavigationController(for: ChosingRadomUser(), title: "UserList", image: UIImage(systemName: "person")!),
        ]
    }
    
    fileprivate func createNavigationController(for rootViewController : UIViewController, title: String, image: UIImage) -> UIViewController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        return nav
    }
    
}

