//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Muhammad Talha on 24/09/2023.
//

import UIKit

class RMTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }
    
    private func setUpTabs(){
        let characterVC = RMCharacterViewController()
        let locationVC = RMLocationViewController()
        let settingsVC = RMSettingsViewController()
        let episodeVC = RMEpisodeViewController ()
        
        
        let nav1 = UINavigationController(rootViewController: characterVC)
        let nav2 = UINavigationController(rootViewController: locationVC)
        let nav3 = UINavigationController(rootViewController: episodeVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Character",
                                       image: UIImage(systemName: "person"),
                                       tag: 1)
        
        nav2.tabBarItem = UITabBarItem(title: "Location",
                                       image: UIImage(systemName: "globe"),
                                       tag: 1)
        
        nav3.tabBarItem = UITabBarItem(title: "Episode",
                                       image: UIImage(systemName: "tv"),
                                       tag: 1)
        
        nav4.tabBarItem = UITabBarItem(title: "Settings",
                                       image: UIImage(systemName: "gear"),
                                       tag: 1)
        
        for nav in [nav1,nav2,nav3,nav4]{
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [nav1,nav2,nav3,nav4],
            animated: true
        )
    }
    
}
