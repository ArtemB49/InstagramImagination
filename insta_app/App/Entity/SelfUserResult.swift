//
//  SelfUserResult.swift
//  insta_app
//
//  Created by Артем Б on 21.08.2018.
//  Copyright © 2018 Артем Б. All rights reserved.
//

import Foundation

struct SelfUser: Codable {
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case user = "data"
    }
    
    struct User: Codable {
        let userID: String
        let userName: String
        let fullName: String
        let profilePicture: URL
        let bio: String
        let website: String
        let isBusiness: Bool
        let counts: Counts
        
        enum CodingKeys: String, CodingKey {
            case userID = "id"
            case userName = "username"
            case fullName = "full_name"
            case profilePicture = "profile_picture"
            case bio = "bio"
            case website = "website"
            case isBusiness = "is_business"
            case counts = "counts"
        }
        
        struct Counts: Codable {
            let media: Int
            let follows: Int
            let followedBy: Int
            
            enum CodingKeys: String, CodingKey {
                case media
                case follows
                case followedBy = "followed_by"
            }
        }
    }
}


