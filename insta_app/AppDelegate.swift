//
//  AppDelegate.swift
//  insta_app
//
//  Created by Артем Б on 21.08.2018.
//  Copyright © 2018 Артем Б. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        self.window = UIWindow()
        
        let firstViewController: UIViewController
        
        if Credential.isUserAuthenticated {
            let mainViewController = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController")
            firstViewController = mainViewController
        } else {
            guard let authenticationController = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "AuthViewController") as? AuthViewController else {
                return false
            }
            authenticationController.delegate = self
            firstViewController = authenticationController
        }
        
        self.window?.rootViewController = firstViewController
        self.window?.makeKeyAndVisible()
        return true
    }
}

extension AppDelegate: AuthViewControllerDelegate {
    func authenticationViewController(_ viewController: UIViewController, authorizedWith token: String?) {
        Credential.token = token
        let mainViewController = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController")
        viewController.present(mainViewController, animated: true, completion: nil)
    }
}
