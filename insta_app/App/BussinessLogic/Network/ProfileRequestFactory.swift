/**
 * Фабрика пользователя
 */

import Foundation
import Alamofire

protocol ProfileRequestFactory {
    
    func getUser(
        by accessToken: String,
        completionHandler: @escaping (DataResponse<SelfUser>) -> Void)
    
    
}

