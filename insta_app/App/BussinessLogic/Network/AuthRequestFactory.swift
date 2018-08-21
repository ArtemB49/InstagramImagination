/**
 * Фабрика авторизации
 */

import Foundation
import Alamofire

protocol AuthRequestFactory {
    
//    func login(
//        userName: String,
//        password: String,
//        completionHandler: @escaping (DataResponse<LoginResult>) -> Void
//    )
    
    func getUser(
        by accessToken: String,
        completionHandler: @escaping (DataResponse<SelfUser>) -> Void)
}

