//
//  AuthViewControllerDelegate.swift
//  insta_app
//
//  Created by Артем Б on 21.08.2018.
//  Copyright © 2018 Артем Б. All rights reserved.
//

import Foundation
import UIKit

protocol AuthViewControllerDelegate: class {
    func authenticationViewController(_ viewController: UIViewController, authorizedWith token: String?)
}
