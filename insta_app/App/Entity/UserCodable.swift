//
//  UserCodable.swift
//  insta_app
//
//  Created by Артем Б on 25.08.2018.
//  Copyright © 2018 Артем Б. All rights reserved.
//

import Foundation

struct UserCodable: Codable {
    let userID: String
    let userName: String
    let fullName: String
    let profilePicture: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "id"
        case userName = "username"
        case fullName = "full_name"
        case profilePicture = "profile_picture"
    }
}
