/**
 * Модель ответа сервера на Вход пользователя
 */

import Foundation

struct LoginResult: Codable {
    let accessToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
    
    struct User: Codable {
        let userID: Int
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
}
