//
//  FirtsControllerFactoryIPad.swift
//  insta_app
//
//  Created by Артем Б on 25.08.2018.
//  Copyright © 2018 Артем Б. All rights reserved.
//

import Foundation
import UIKit

class FirtsControllerFactoryIPad: FirtsControllerFactory {
    private func viewController(of type: FirstViewControllerTypeIPad) -> UIViewController {
        switch type {
        case .selfPublications:
            return UIStoryboard(name: "Publications", bundle: nil).instantiateViewController(withIdentifier: "PublicationTableViewController")
        case .auth:
            let builder = AuthDefaultBuilder()
            return builder.viewController()
        }
    }
    
    func viewController(isAuth: Bool) -> UIViewController {
        return viewController(of: isAuth ? .selfPublications : .auth)
    }
}

private enum FirstViewControllerTypeIPad {
    case selfPublications
    case auth
}
