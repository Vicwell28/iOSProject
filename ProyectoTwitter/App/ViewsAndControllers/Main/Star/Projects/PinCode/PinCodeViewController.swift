//
//  PinCodeViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 28/08/22.
//

import UIKit
import Alamofire
import NotificationBannerSwift

class PinCodeViewController: UIViewController {
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerVerifyCode), userInfo: nil, repeats: true)
    }
    
    @objc private func timerVerifyCode(){
        if self.seconds == 0 {
            self.seconds = 60
            if self.minutes > 0 {
                self.minutes -= 1
            }
        } else {
            self.seconds -= 1
        }
        self.timeLable.text = "\(self.minutes):\(self.seconds)"
    }
    
    //MARK: - Private Var / Let
    private var indexPos : UInt8 = 0
    private var stringcodeUser : String = String()
    private var stringCodeAvailable : String = "12345"
    private var isEmptyTextField : Bool = false
    private var minutes : Int = 5
    private var seconds : Int = 0
    
    //MARK: - Public Var / Let
    
    
    @IBOutlet weak var timeLable: UILabel!
    
    //MARK: - @IBOutlet
    @IBOutlet var textFieldsCollection: [UITextField]!
}

//MARK: - @IBAction
extension PinCodeViewController {
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func verifyCodeAction(_ sender: UIButton) {
        self.stringcodeUser = String()
        self.isEmptyTextField = false
        self.textFieldsCollection.forEach { textField in
            if !textField.hasText {
                self.isEmptyTextField = true
            }
        }
        
        if isEmptyTextField {
            NotificationBanner(title: "", subtitle: "Llenar los campos",  style: .danger).show()
            return
        }
        
        self.textFieldsCollection.forEach { textField in
            self.stringcodeUser += textField.text!
        }
        
        if self.stringcodeUser == self.stringCodeAvailable {
            NotificationBanner(title: "", subtitle: "VALIDO",  style: .success).show()
        } else {
            NotificationBanner(title: "", subtitle: "INVALIDO",  style: .warning).show()
        }
    }
}
//MARK: - public func
extension PinCodeViewController {
    
}
//MARK: - Private func
extension PinCodeViewController {
    
}
//MARK: - Services
extension PinCodeViewController {
    
}
//MARK: - Other
extension PinCodeViewController : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
            if self.indexPos > 0 {
                self.textFieldsCollection[Int(self.indexPos)].text = ""
                self.indexPos -= 1
                self.textFieldsCollection[Int(self.indexPos)].becomeFirstResponder()
                return false
            }
        } else {
            if self.indexPos < self.textFieldsCollection.count-1 {
                self.textFieldsCollection[Int(self.indexPos)].text = string
                self.indexPos += 1
                self.textFieldsCollection[Int(self.indexPos)].becomeFirstResponder()
            } else if textField.hasText {
                return false
            }
        }
        return true
    }
}


////MARK: - Override func
////MARK: - Private Var / Let
////MARK: - Public Var / Let
////MARK: - @IBOutlet
////MARK: - @IBAction
//extension PinCodeViewController {
//
//}
////MARK: - public func
//extension PinCodeViewController {
//
//}
////MARK: - Private func
//extension PinCodeViewController {
//
//}
////MARK: - Services
//extension PinCodeViewController {
//
//}
////MARK: - Other
//extension PinCodeViewController {
//
//}



