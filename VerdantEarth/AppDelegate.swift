//
//  AppDelegate.swift
//  VerdantEarth
//
//  Created by Shwait Kumar on 09/01/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        self.pushToIntroductionViewController()
        
        return true
    }
    
    func pushToIntroductionViewController() -> Void {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IntroductionViewController") as! IntroductionViewController
        let navVc = UINavigationController.init(rootViewController: vc)
        self.window?.rootViewController = navVc
        self.window?.makeKeyAndVisible()
    }


}

