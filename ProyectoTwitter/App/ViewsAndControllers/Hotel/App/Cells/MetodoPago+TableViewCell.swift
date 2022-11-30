//
//  MetodoPago+TableViewCell.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 30/11/22.
//

import UIKit

class MetodoPago_TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.imageViewPaymentMethod.cornerRadius = self.imageViewPaymentMethod.frame.width / 2
    }
    
    @IBOutlet weak var imageViewPaymentMethod: UIImageView!
}
