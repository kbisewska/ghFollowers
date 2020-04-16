//
//  GFTabBarController.swift
//  GHFollowers
//
//  Created by Kora on 16/04/2020.
//  Copyright © 2020 kbisewska. All rights reserved.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNavigationController(), createFavoritesNavigationController()]
    }
    
    func createSearchNavigationController() -> UINavigationController {
         let searchViewController = SearchViewController()
         searchViewController.title = "Search"
         searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
         
         return UINavigationController(rootViewController: searchViewController)
     }
     
     func createFavoritesNavigationController() -> UINavigationController {
         let favoritesListViewController = FavoritesListViewController()
         favoritesListViewController.title = "Favorites"
         favoritesListViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
         
         return UINavigationController(rootViewController: favoritesListViewController)
     }
}
