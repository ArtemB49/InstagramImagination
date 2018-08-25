//
//  PublicationTableViewCell.swift
//  insta_app
//
//  Created by Артем Б on 25.08.2018.
//  Copyright © 2018 Артем Б. All rights reserved.
//

import UIKit
import Alamofire

class PublicationTableViewCell: UITableViewCell {

    @IBOutlet weak var publicationImage: UIImageView!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    var imageURL: URL? {
        willSet(url) {
            dowloadImage(url: url)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func dowloadImage(url: URL?){
        guard let url = url else {
            return
        }
        Alamofire.request(url).responseData { response in
            if let data = response.data{
                self.publicationImage.image = UIImage(data: data, scale: 1)
            }
        }
    }

}
