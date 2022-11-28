//
//  PurchaseDatail+HotelViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 21/11/22.
//

import UIKit

class PurchaseDatail_HotelViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Private Var / Let
    
    //MARK: - Public Var / Let
    
    //MARK: - @IBOutlet

    @IBOutlet weak var lableStepper: UILabel!
    @IBAction func stepper(_ sender: UIStepper) {
        self.lableStepper.text = "\(sender.value)"
        
    }
}

//MARK: - @IBAction
extension PurchaseDatail_HotelViewController {

}
//MARK: - public func
extension PurchaseDatail_HotelViewController {

}
//MARK: - Private func
extension PurchaseDatail_HotelViewController {

}
//MARK: - Services
extension PurchaseDatail_HotelViewController {

}
//MARK: - Other
extension PurchaseDatail_HotelViewController {

}
