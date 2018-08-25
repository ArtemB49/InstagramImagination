/**
 * Реализаци фабрики авторизации
 */

import Foundation
import Alamofire

class ProfileRequestFactoryImpl: BaseRequestFactory, ProfileRequestFactory {
    func getUser(by accessToken: String, completionHandler: @escaping (DataResponse<SelfUser>) -> Void) {
        let requestModel = SelfUserRequestData(baseUrl: baseUrl, accessToken: accessToken)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProfileRequestFactoryImpl {
    struct SelfUserRequestData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let accessToken: String
        let path: String = "users/self/"
        
        var parameters: Parameters? {
            return [
                "access_token": accessToken
            ]
        }
    }
}
