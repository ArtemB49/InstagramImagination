/**
 * Модель ответа сервера на Вход пользователя
 */

import Foundation

struct LoginResult: Codable {
    let accessToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}
