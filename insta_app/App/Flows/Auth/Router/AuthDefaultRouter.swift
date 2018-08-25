//
//  AuthDefaultRouter.swift
//  insta_app
//
//  Created by Артем Б on 25.08.2018.
//  Copyright © 2018 Артем Б. All rights reserved.
//

import Foundation
import UIKit

class AuthDefaultRouter: AuthRouter {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func navigateAuthSuccess() {
        let mainViewController = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController")
        viewController?.present(mainViewController, animated: true, completion: nil)
    }
}
