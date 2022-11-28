//
//  SingInViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 21/11/22.
//

import UIKit

class SingInHotelViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewCircle.cornerRadius = viewCircle.frame.width / 2
    }

    //MARK: - Private Var / Let
    
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    //MARK: - Public Var / Let
    
    @IBOutlet weak var viewCircle: UIView!
    //MARK: - @IBOutlet
}

//MARK: - @IBAction
extension SingInHotelViewController {

}
//MARK: - public func
extension SingInHotelViewController {

}
//MARK: - Private func
extension SingInHotelViewController {

}
//MARK: - Services
extension SingInHotelViewController {

}
//MARK: - Other
extension SingInHotelViewController : UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(textField)
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Retrun : \(textField)")
        
        if textField == self.textFieldEmail {
            self.textFieldPassword.becomeFirstResponder()
        } else {
            self.textFieldPassword.resignFirstResponder()
        }
        
        return true
    }
}
