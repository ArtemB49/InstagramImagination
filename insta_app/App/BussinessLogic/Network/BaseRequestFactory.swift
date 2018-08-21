/**
 * Основа реализаций фабрик запросов
 */

import Foundation
import Alamofire

class BaseRequestFactory: AbstractRequestFactory {
    
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let baseUrl = URL(string:
        "https://api.instagram.com/v1/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: SessionManager,
        queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}
