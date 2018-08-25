/**
 * Фабрика авторизации
 */

import Foundation
import Alamofire

protocol PublicationRequestFactory {
    
    func getSelfPublication(
        by accessToken: String,
        completionHandler: @escaping (DataResponse<SelfPublicationResult>) -> Void)
}
