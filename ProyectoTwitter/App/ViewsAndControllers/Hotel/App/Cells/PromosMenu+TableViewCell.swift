//
//  PromosMenu+TableViewCell.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 24/11/22.
//

import UIKit

class PromosMenu_TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewImage.layer.cornerRadius = viewImage.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var viewImage: UIView!
}
