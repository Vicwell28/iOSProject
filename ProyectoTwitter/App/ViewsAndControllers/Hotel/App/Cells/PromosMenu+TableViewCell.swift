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
        viewImage.layer.cornerRadius = viewImage.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBOutlet weak var viewImage: UIView!
}
