//
//  FirtsControllerFactoryIPhone.swift
//  insta_app
//
//  Created by Артем Б on 25.08.2018.
//  Copyright © 2018 Артем Б. All rights reserved.
//

import Foundation
import UIKit

class FirtsControllerFactoryIPhone: FirtsControllerFactory {
    private func viewController(of type: FirstViewControllerTypeIPhone) -> UIViewController {
        switch type {
        case .selfProfile:
            return UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController")
        case .auth:
            let builder = AuthDefaultBuilder()
            return builder.viewController()
        }
    }
    
    func viewController(isAuth: Bool) -> UIViewController {
        return viewController(of: isAuth ? .selfProfile : .auth)
    }
}

private enum FirstViewControllerTypeIPhone {
    case selfProfile
    case auth
}
