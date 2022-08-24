//
//  LoginViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 14/08/22.
//

import UIKit
import Alamofire
import NotificationBanner

class SingUpViewController: UIViewController {
    // MARK: - Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginViewController viewDidLoad")
        print("Token: \(dataSingleton.token)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("LoginViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("LoginViewController viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("LoginViewController viewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("LoginViewController viewWillDisappear")
    }
//    func registerForKeyboardNotifications(){
//        //Adding notifies on keyboard appearing
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: NSNotification.Name.UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.addObserver(forName: ., object: <#T##Any?#>, queue: <#T##OperationQueue?#>, using: <#T##(Notification) -> Void#>)
//    }
//
//    func deregisterFromKeyboardNotifications(){
//        //Removing notifies on keyboard appearing
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: .Nam, object: <#T##Any?#>)
//    }

    @objc func keyboardWasShown(notification: NSNotification){
        //Need to calculate keyboard exact size due to Apple suggestions
        self.scrollView.isScrollEnabled = true
        var info = notification.userInfo!
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize!.height, right: 0.0)

        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets

        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if let activeField = self.activeField {
            if (!aRect.contains(activeField.frame.origin)){
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }

    @objc func keyboardWillBeHidden(notification: NSNotification){
        //Once keyboard disappears, restore original positions
        var info = notification.userInfo!
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: -keyboardSize!.height, right: 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
        self.scrollView.isScrollEnabled = false
    }

   
    var dataSingleton : DataSingleton = DataSingleton.shared

    
    var activeField: UITextField?
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    @IBOutlet weak var usernameValidateLable: UILabel!
    @IBOutlet weak var emailValidateLable: UILabel!
    @IBOutlet weak var newPasswordValidateLable: UILabel!
    @IBOutlet weak var confirmNewPasswordValidateLable: UILabel!
   
}

// MARK: - IBOutlet
extension SingUpViewController {
    
}

// MARK: - IBAction
extension SingUpViewController {
    @IBAction func TapGesture(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func verifyData(_ sender: UITextField) {
        verifyDataSingUp(sender)
    }
    
    @IBAction func singUpAction() {
        NotificationBanner(title: "LLENA LOS PUTOS CAMPOS", subtitle: "los campos por favor", style: .warning).show()
    }
}

// MARK: - Public Func
extension SingUpViewController {
    
}

// MARK: - Private Func
extension SingUpViewController {
    private func verifyDataSingUp(_ sender : UITextField){
        if sender.tag == 0 {
            if !sender.hasText {
                self.usernameValidateLable.isHidden = false
            } else {
                self.usernameValidateLable.isHidden = true
            }
        } else if sender.tag == 1 {
            if !sender.hasText {
                self.emailValidateLable.isHidden = false
            } else {
                self.emailValidateLable.isHidden = true
            }
        } else if sender.tag == 2 {
            if !sender.hasText {
                self.newPasswordValidateLable.isHidden = false
            } else {
                self.newPasswordValidateLable.isHidden = true
            }
        } else {
            if !sender.hasText {
                self.confirmNewPasswordValidateLable.isHidden = false
            } else {
                self.confirmNewPasswordValidateLable.isHidden = true
            }
        }
    }
}

// MARK: - Services
extension SingUpViewController {
    
}

// MARK: - Other
extension SingUpViewController {
    
}

// MARK: - Other
extension SingUpViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            self.emailTextField.becomeFirstResponder()
        } else if textField.tag == 1 {
            self.newPasswordTextField.becomeFirstResponder()
        } else if textField.tag == 2 {
            self.confirmNewPasswordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        verifyDataSingUp(textField)
        activeField = nil
    }
}

