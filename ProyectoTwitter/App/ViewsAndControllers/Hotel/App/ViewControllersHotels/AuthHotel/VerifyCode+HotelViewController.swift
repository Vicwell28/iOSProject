//
//  VerifyCode+HotelViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 21/11/22.
//

import UIKit

class VerifyCode_HotelViewController: UIViewController {

    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewPointsCollections.forEach({ $0.cornerRadius = $0.frame.width / 2})
    }
    
    //MARK: - Private Var / Let
    private var indexPosition : Int = 0
    
    //MARK: - Public Var / Let
    
   
    //MARK: - @IBOutlet
    @IBOutlet var viewPointsCollections: [UIView]!
    @IBOutlet var lablesNumbresCollections: [UILabel]!
}


//MARK: - @IBAction
extension VerifyCode_HotelViewController {
    @IBAction func onClickNumberAction(_ sender: UIButton) {
        print("Index \(indexPosition) Tag \(sender.tag)")
        
        if sender.tag > 9 {
          
            UIView.animate(withDuration: 0.5) {
                self.viewPointsCollections[self.indexPosition].alpha = 1
            }

            if indexPosition != 0 {
                indexPosition -= 1
            }
            
            return
        }
        
        
        self.lablesNumbresCollections[self.indexPosition].text = "\(sender.tag)"

        UIView.animate(withDuration: 0.5) {
            self.viewPointsCollections[self.indexPosition].alpha = 0
        } completion: { Bool in
            self.lablesNumbresCollections[self.indexPosition].alpha = 0
            UIView.animate(withDuration: 0.5) {
                self.lablesNumbresCollections[self.indexPosition].alpha = 1
            }
        }
        

        if indexPosition != 3 {
            indexPosition += 1
        } else {
            self.showViewControllerLoaderHotel()
            Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { Timer in
                self.dismissViewControllerLoaderHotel()
                self.performSegue(withIdentifier: "segueMain", sender: nil)
            }
        }
    }
}
//MARK: - public func
extension VerifyCode_HotelViewController {

}
//MARK: - Private func
extension VerifyCode_HotelViewController {

}
//MARK: - Services
extension VerifyCode_HotelViewController {

}
//MARK: - Other
extension VerifyCode_HotelViewController {

}
