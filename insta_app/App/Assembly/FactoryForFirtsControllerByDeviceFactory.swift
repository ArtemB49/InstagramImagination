//
//  FactoryForFirtsControllerByDeviceFactory.swift
//  insta_app
//
//  Created by Артем Б on 25.08.2018.
//  Copyright © 2018 Артем Б. All rights reserved.
//

import Foundation
import UIKit

class FactoryForFirtsControllerByDeviceFactory {
    func makeFirstControllerFabric(by device: UIUserInterfaceIdiom) -> FirtsControllerFactory {
        switch device {
        case .phone:
            return FirtsControllerFactoryIPhone()
        case .pad:
            return FirtsControllerFactoryIPad()
        default:
            return FirtsControllerFactoryIPhone()
        }
    }
}
