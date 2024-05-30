//
//  AppDelegate.swift
//  ApplicationLifeCycle1
//
//  Created by Nagarajan on 8/27/14.
//  Copyright (c) 2014 Nagarajan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    
    var lifeCycleState : String? {
        didSet {
            if let state = lifeCycleState{
                print(state)
            }
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        lifeCycleState = #function
        self.window = UIWindow(frame: UIScreen.main.bounds)
        // Override point for customization after application launch.
        self.window!.backgroundColor = UIColor.white
        let viewController: UIViewController = ViewController()
        self.window?.rootViewController = viewController
        self.window!.makeKeyAndVisible()
        return true
    }


    func applicationWillResignActive(_ application: UIApplication)
    {
        lifeCycleState = #function
    }

    func applicationDidEnterBackground(_ application: UIApplication)
    {
        lifeCycleState = #function
    }

    func applicationWillEnterForeground(_ application: UIApplication)
    {
        lifeCycleState = #function
    }

    func applicationDidBecomeActive(_ application: UIApplication)
    {
        lifeCycleState = #function
    }

    func applicationWillTerminate(_ application: UIApplication)
    {
        lifeCycleState = #function
    }


}

