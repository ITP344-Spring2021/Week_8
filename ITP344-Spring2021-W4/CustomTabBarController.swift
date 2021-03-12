//
//  CustomTabBarController.swift
//  ITP344-Spring2021-W4
//
//  Created by Jack Xu on 3/2/21.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = UINavigationController(rootViewController: PrioritiesViewController())
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let secondVC = SignInViewController()
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        let thirdVC = ListViewController()
        thirdVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 2)
        
        viewControllers = [firstVC, secondVC, thirdVC]
    }

}
