//
//  AuthDefaultBuilder.swift
//  insta_app
//
//  Created by Артем Б on 25.08.2018.
//  Copyright © 2018 Артем Б. All rights reserved.
//

import Foundation
import UIKit

class AuthDefaultBuilder: AuthBuilder {
    
    func viewController() -> UIViewController {
        guard let viewController = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "AuthViewController") as? AuthViewController else {
            return AuthViewController()
        }
        let router = AuthDefaultRouter(viewController: viewController)
        viewController.router = router
        return viewController
    }
}
