//
//  ProfileViewController.swift
//  insta_app
//
//  Created by Артем Б on 21.08.2018.
//  Copyright © 2018 Артем Б. All rights reserved.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {
    
    let authFactory: AuthRequestFactory
        = RequestFactory().makeAuthRequestFactory()

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let accessToken = Credential.token {
            authFactory.getUser(by: accessToken) { response in
                switch response.result {
                case .success(let selfUser):
                    self.updateUI(data: selfUser)
                case .failure(let error):
                    print("Error \(error.localizedDescription)")
                }
            }
        }
    }
    
    func updateUI(data: SelfUser) {
        DispatchQueue.main.async {
            self.userNameLabel.text = data.user.userName
            self.fullNameLabel.text = data.user.fullName
            self.dowloadImage(url: data.user.profilePicture)
        }
        
    }
    
    func dowloadImage(url: URL){
        Alamofire.request(url).responseData { response in
            if let data = response.data{
                self.profileImageView.image = UIImage(data: data, scale: 1)
            }
        }
    }
}
