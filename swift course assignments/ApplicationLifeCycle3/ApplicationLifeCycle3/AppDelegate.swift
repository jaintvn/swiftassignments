//
//  AppDelegate.swift
//  ApplicationLifeCycle3
//
//  Created by Nagarajan on 8/28/14.
//  Copyright (c) 2014 Nagarajan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor.white
        
        let controller = ViewController()
        self.window!.rootViewController = controller
        
        self.window!.makeKeyAndVisible()
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        manageViewData(.didEnterBackground)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        manageViewData(.didBecomeActive)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        manageViewData(.willTerminate)
    }
    
    func manageViewData(_ appLifeCycleState : LifecycleMethod){
        switch appLifeCycleState {
            case .didEnterBackground, .willTerminate : saveData()
            case .didBecomeActive : setStoredData()
        }
    }
    
    func saveData() {
        //To save entered values into file
        let controller: ViewController = self.window!.rootViewController  as! ViewController
        let values:NSArray = [controller.question!.text!, controller.answer!.text!]
        values.write(toFile: saveFilePath() as String, atomically: true)
    }
    
    func setStoredData() {
        //It get store data in file and set to question and answer views.
        let storedData = getStoredData()
        let controller:ViewController = self.window!.rootViewController as! ViewController
        controller.question!.text = storedData?.question
        controller.answer!.text = storedData?.answer
    }
    
    func getStoredData() -> (question : String?, answer : String?)? {
        //To get Stored data in file
        let filePath:NSString = saveFilePath()
        let fileExists:Bool = FileManager.default.fileExists(atPath: filePath as String)
        if(fileExists)
        {
            let value = NSArray(contentsOfFile: filePath as String)
            if(value!.count > 0)
            {
                return(question : value!.object(at: 0) as? String, answer : value!.object(at: 1) as? String)
            }
        }
        return nil
    }
    
    func saveFilePath() -> NSString
    {
        let path:NSArray = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
            FileManager.SearchPathDomainMask.userDomainMask, true) as NSArray
        return (path[0] as! String) + "saveFile.plist" as NSString
    }
    
    enum LifecycleMethod {
        case didEnterBackground
        case didBecomeActive
        case willTerminate
    }

}

