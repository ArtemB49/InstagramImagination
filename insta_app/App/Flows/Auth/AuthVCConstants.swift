//
//  AuthVCConstants.swift
//  insta_app
//
//  Created by Артем Б on 21.08.2018.
//  Copyright © 2018 Артем Б. All rights reserved.
//

import Foundation
extension AuthViewController {
    struct Constants {
        static let host = "https://api.instagram.com/v1"
        static let token = "?access_token="
        
        static func URLFor(apiMethod: String, token: String)-> String {
            return self.host + apiMethod + self.token + token
        }
        
        static let clientId = "5fc3411b400f47d28b3b52e84f47e220"
        static let redirectUri = "https://www.instagram.com/"
        static let scope = "public_content+follower_list+relationships+comments+likes"
        static let responseType = "token"
        static let separetingItem = "#access_token"
    }
}

