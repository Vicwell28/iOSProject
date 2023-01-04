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
        
        self.showLoadingExtension()
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { Timer in
            self.hideLoadingExtension()
            
            if self.stringcodeUser == self.stringCodeAvailable {
                NotificationBanner(title: "", subtitle: "VALIDO",  style: .success).show()
            } else {
                NotificationBanner(title: "", subtitle: "INVALIDO",  style: .warning).show()
            }
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
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            textField.transform = CGAffineTransform(scaleX: 1.1, y: 1.1);
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            textField.transform = CGAffineTransform(scaleX: 0.9, y: 0.9);
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
            if(self.textFieldsCollection[textField.tag].hasText){
                self.textFieldsCollection[textField.tag].text = ""
                if(textField.tag > 0){
                    self.textFieldsCollection[(textField.tag - 1)].becomeFirstResponder()
                }
                return false
            }
        }
            
        if textField.tag < self.textFieldsCollection.count-1 {
            self.textFieldsCollection[(textField.tag)].text = string
            self.textFieldsCollection[(textField.tag + 1)].becomeFirstResponder()
        }

        textField.text = string
        textField.resignFirstResponder()
        return true
        
    }
}
