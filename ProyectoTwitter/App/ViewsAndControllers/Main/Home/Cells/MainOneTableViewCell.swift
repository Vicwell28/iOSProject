//
//  MainOneTableViewCell.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 26/08/22.
//

import UIKit

class MainOneTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLable: UILabel!
    @IBOutlet weak var authorLable: UILabel!
    @IBOutlet weak var textTextView: UITextView!
    @IBOutlet weak var imageUrlImageView: UIImageView!
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
    
    public func setUpCell(text : String, username : String, author : String, imageView : String?){
        
        self.textTextView.text = text
        self.authorLable.text = author
        self.usernameLable.text = username
        
    }
    
}
