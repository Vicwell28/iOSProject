//
//  RegisterViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 14/08/22.
//

import UIKit

class SingInViewController: UIViewController {
    // MARK: - Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        print("RegisterViewController viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("RegisterViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("RegisterViewController viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("RegisterViewController viewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("RegisterViewController viewWillDisappear")
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailValidateLable: UILabel!
    @IBOutlet weak var passwordValidateLable: UILabel!
    
}
// MARK: - IBAction
extension SingInViewController {
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func textFieldAction(_ sender: UITextField) {
        self.verifyCredentials(sender)
    }
}

// MARK: - Public Func
extension SingInViewController {
    
}

// MARK: - Private Func
extension SingInViewController {
    private func verifyCredentials(_ sender : UITextField){
        if sender.tag == 0 {
            if !sender.hasText {
                self.emailValidateLable.isHidden = false
            } else {
                self.emailValidateLable.isHidden = true
            }
        } else {
            if !sender.hasText {
                self.passwordValidateLable.isHidden = false
            } else {
                self.passwordValidateLable.isHidden = true
            }
        }
    }
}

// MARK: - Services
extension SingInViewController {
    
}

// MARK: - Other
extension SingInViewController {
    
}
// MARK: - UITextFieldDelegate
extension SingInViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            self.passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.verifyCredentials(textField)
    }
}

