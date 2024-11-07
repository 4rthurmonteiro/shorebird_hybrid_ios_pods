//
//  TabController.swift
//  MultipleFluttersIos
//
//  Created by Arthur Monteiro Alves Melo on 26/09/24.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .white
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: GoogleMapsFlutterController())
        let flutterWebView = self.createNav(with: "Flutter Site", and: UIImage(systemName: "note"), vc: WebViewFlutterController())
        let googleWebView = self.createNav(with: "Google Site", and: UIImage(systemName: "note.text"), vc: WebViewGoogleController())

        
        self.setViewControllers([home, flutterWebView, googleWebView], animated: true)
    }
    
//    private func setupTabs() {
//        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeController())
//        let flutterWebView = self.createNav(with: "Flutter Site", and: UIImage(systemName: "note"), vc: HomeController())
//        let googleWebView = self.createNav(with: "Google Site", and: UIImage(systemName: "note.text"), vc: HomeController())
//
//        
//        self.setViewControllers([home, flutterWebView, googleWebView], animated: true)
//    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
//        nav.navigationItem.title = title
        nav.viewControllers.first?.navigationItem.title = title + " Controller"
        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        
        return nav
    }
}
