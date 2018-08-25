//
//  SelfPublicationResult.swift
//  insta_app
//
//  Created by Артем Б on 25.08.2018.
//  Copyright © 2018 Артем Б. All rights reserved.
//

import Foundation

struct SelfPublicationResult: Codable {
    let pagination: [String:String]?
    let data: [Publication]
    let meta: Meta
    
    enum CodingKeys: String, CodingKey {
        case pagination
        case data
        case meta
    }
}

struct Publication: Codable {
    let publicationID: String
    let user: UserCodable
    let images: ImagesCodable
    let createdTime: String
    let caption: CaptionCodable
    let hasLikes: Bool
    let likes: LikesCodable
    let tags: [String]
    let filter: String
    let comments: CommentsCodable
    let type: String
    let link: String
    let location: String?
    let attribution: String?
    let userInPhoto: [String]?
    
    enum CodingKeys: String, CodingKey {
        case publicationID = "id"
        case user
        case images
        case createdTime = "created_time"
        case caption
        case hasLikes = "user_has_liked"
        case likes
        case tags
        case filter
        case comments
        case type
        case link
        case location
        case attribution
        case userInPhoto = "users_in_photo"
    }
    
}

struct ImagesCodable: Codable {
    let thumbnail: ImageCodable
    let lowResolution: ImageCodable
    let standardResolution: ImageCodable
    
    enum CodingKeys: String, CodingKey {
        case thumbnail
        case lowResolution = "low_resolution"
        case standardResolution = "standard_resolution"
    }
}

struct Meta: Codable {
    let code: Int
}
    
struct ImageCodable: Codable {
    let width: Int
    let height: Int
    let url: URL
}

struct CaptionCodable: Codable {
    let captionID: String
    let text: String
    let createdTime: String
    let from: UserCodable
    
    enum CodingKeys: String, CodingKey {
        case captionID = "id"
        case text
        case createdTime = "created_time"
        case from
    }
}

struct LikesCodable: Codable {
    let count: Int
}

struct CommentsCodable: Codable {
    let count: Int
}
