//
//  CryptoCellTableViewCell.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 27/09/22.
//

import UIKit

class CryptoCellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var titleCellLable: UILabel!
    @IBOutlet weak var desCellLable: UILabel!
}
