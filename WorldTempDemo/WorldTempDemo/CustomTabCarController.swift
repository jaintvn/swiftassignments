//
//  ViewController.swift
//  WorldTempDemo
//
//  Created by Amarjit Singh on 04/06/24.
//

import UIKit

class CustomTabCarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    lazy public var temperatureController : TemperatureController =  {
        return getTabBar(title: "Convert", iconName: "ConvertIcon.png", controller: TemperatureController())
    }() as! TemperatureController
    
    lazy public var mapUIController : MapUIController =  {
        return getTabBar(title: "Map", iconName: "MapIcon.png", controller: MapUIController())
    }() as! MapUIController
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewControllers = [temperatureController, mapUIController]
        tabBar.backgroundColor = UIColor.white
    }
    
    func getTabBar(title : String, iconName : String, controller : UIViewController) -> UIViewController{
        let tabBar = controller
        let tabBarItem = UITabBarItem(title: title, image: UIImage(named: iconName), tag: 1)
        tabBar.tabBarItem = tabBarItem
        return tabBar
    }
    
}

