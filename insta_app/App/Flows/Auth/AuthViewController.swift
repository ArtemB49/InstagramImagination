//
//  AuthViewController.swift
//  insta_app
//
//  Created by Артем Б on 21.08.2018.
//  Copyright © 2018 Артем Б. All rights reserved.
//

import UIKit
import WebKit

class AuthViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    var router: AuthRouter!
    
    let url: URL = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.instagram.com"
        components.path = "/oauth/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: Constants.clientId),
            URLQueryItem(name: "redirect_uri", value: Constants.redirectUri),
            URLQueryItem(name: "scope", value: Constants.scope),
            URLQueryItem(name: "response_type", value: Constants.responseType)
        ]
        return components.url!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = URLRequest(
            url: self.url,
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 15.0)
        webView.navigationDelegate = self
        webView.load(request)
    }
}

extension AuthViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let urlString = navigationAction.request.url?.absoluteString else {
            decisionHandler(.allow)
            return
        }
        guard urlString.range(of: Constants.separetingItem) != nil else {
            decisionHandler(.allow)
            return
        }
        if let accessToken = urlString
            .components(separatedBy: "\(Constants.separetingItem)=")
            .last {
            router.navigateAuthSuccess()
            Credential.token = accessToken
            decisionHandler(.cancel)
        }
    }
}
