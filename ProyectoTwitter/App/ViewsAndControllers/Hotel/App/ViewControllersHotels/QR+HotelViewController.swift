//
//  QR+HotelViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 21/11/22.
//

import UIKit

class QR_HotelViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Private Var / Let
    
    //MARK: - Public Var / Let
    
    //MARK: - @IBOutlet

    @IBAction func hideViewQR(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1) {
            self.qrContainerView.alpha = 0
        } completion: { Bool in
            self.okContainerView.alpha = 0
            self.qrContainerView.isHidden = true;
            self.okContainerView.isHidden = false;
            UIView.animate(withDuration: 1) {
                self.okContainerView.alpha = 1
            } completion: { Bool in
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { Timer in
                    
                    print("PANTALLAS : \(String(describing: self.view.window))")
                    print("PANTALLAS : \(String(describing: self.view.window?.rootViewController))")
                    self.view.window?.rootViewController?.dismiss(animated: true)
                    
                    
                }
            }
        }

        
    }
    @IBOutlet weak var okContainerView: UIView!
    @IBOutlet weak var qrContainerView: UIView!
}

//MARK: - @IBAction
extension QR_HotelViewController {

}
//MARK: - public func
extension QR_HotelViewController {

}
//MARK: - Private func
extension QR_HotelViewController {

}
//MARK: - Services
extension QR_HotelViewController {

}
//MARK: - Other
extension QR_HotelViewController {

}
