//
//  MainTabController.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 6.06.2023.
//

import UIKit

class MainTabController: UITabBarController {
    
    //MARK: - Properties
    

    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        configVC()
    }
    
    
    override func viewDidLayoutSubviews() {
        changeHeightOfTabBar()
    }
    
    //MARK: - Helpers

    func changeHeightOfTabBar() {
        if UIDevice().userInterfaceIdiom == .phone {
            var tabFrame = tabBar.frame
            tabFrame.size.height = 90
            tabFrame.origin.y = view.frame.size.height - 70
            tabBar.frame = tabFrame
        }
    }
    
    func configVC() {
        let layout = UICollectionViewFlowLayout()
        let vc1 = UINavigationController(rootViewController: CategoriesController(collectionViewLayout: layout))
        let vc2 = UINavigationController(rootViewController: LikesController())

        vc1.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "music.note.house"), selectedImage: UIImage(systemName: "music.note.house.fill"))
        vc2.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart.rectangle"), selectedImage: UIImage(systemName: "heart.rectangle.fill"))

        setViewControllers([vc1, vc2], animated: true)
        tabBar.tintColor = .white.withAlphaComponent(0.6)
        tabBar.barTintColor = .black.withAlphaComponent(0.6)
    }
    
}
