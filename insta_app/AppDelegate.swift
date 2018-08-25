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
        let deviceFactory
            = FactoryForFirtsControllerByDeviceFactory()
                .makeFirstControllerFabric(by: UIDevice.current.userInterfaceIdiom)
        
        self.window?.rootViewController = deviceFactory.viewController(isAuth: Credential.isUserAuthenticated)
        self.window?.makeKeyAndVisible()
        return true
    }
}
