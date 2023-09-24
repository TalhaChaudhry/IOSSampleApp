//
//  RMSettingsViewController.swift
//  RandomPhoto
//
//  Created by Muhammad Talha on 24/09/2023.
//

import UIKit

final class RMSettingsViewController: UIViewController {
    
    var nav: UINavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Settings"
//        nav = UINavigationController(rootViewController: self)
        navigationItem.largeTitleDisplayMode = .always
//        nav?.navigationBar.prefersLargeTitles = true
    }
    
    
//    public func getNavController() -> UINavigationController {
//        return nav ?? UINavigationController(rootViewController: self)
//    }
}
