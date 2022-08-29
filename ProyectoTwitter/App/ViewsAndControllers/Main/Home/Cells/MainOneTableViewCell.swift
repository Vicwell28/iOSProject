//
//  MainOneTableViewCell.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 26/08/22.
//

import UIKit
import Alamofire

class MainOneTableViewCell: UITableViewCell {
    
    @IBOutlet weak var usernameLable: UILabel!
    @IBOutlet weak var authorLable: UILabel!
    @IBOutlet weak var textTextView: UITextView!
    @IBOutlet weak var imageUrlImageView: UIImageView!
    @IBOutlet weak var svVideo: UIStackView!
    @IBOutlet weak var svLocation: UIStackView!
    /*
     let id : String
     let author : User
     let imageUrl : String
     let text : String
     let videoUrl : String
     let location : Location
     let hasVideo : Bool
     let hasImage : Bool
     let hasLocation : Bool
     let createdAt : String
     */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    public func setUpCell(text : String, username : String, author : String, imageView : String?, hasVideo : Bool, hasImage : Bool, hasLocation : Bool, urlImage : String?){
        
        self.svVideo.isHidden = hasVideo ? false : true
        self.svLocation.isHidden = hasLocation ? false : true
        self.imageUrlImageView.isHidden = hasVideo ? false : true
        
        self.textTextView.text = text
        self.authorLable.text = author
        self.usernameLable.text = username
        
        if let imageUrl = urlImage {
            AF.download(imageUrl).responseURL { response in
                if response.error == nil, let imagePath = response.fileURL?.path {
                    self.imageUrlImageView.image = UIImage(contentsOfFile: imagePath)
                }
            }
        }
    }
}
