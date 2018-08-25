//
//  PublicationRequestFactoryImpl.swift
//  insta_app
//
//  Created by Артем Б on 25.08.2018.
//  Copyright © 2018 Артем Б. All rights reserved.
//

import Foundation
import Alamofire

class PublicationRequestFactoryImpl: BaseRequestFactory, PublicationRequestFactory {
    func getSelfPublication(by accessToken: String, completionHandler: @escaping (DataResponse<SelfPublicationResult>) -> Void) {
        let requestModel = SelfPublicationRequestModel(baseUrl: baseUrl, accessToken: accessToken)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension PublicationRequestFactoryImpl {
    struct SelfPublicationRequestModel: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let accessToken: String
        let path: String = "users/self/media/recent/"
        
        var parameters: Parameters? {
            return [
                "access_token": accessToken
            ]
        }
    }
}
