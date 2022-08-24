//
//  RegisterViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 14/08/22.
//

import UIKit
import Alamofire
import NotificationBanner

class SingInViewController: UIViewController {
    // MARK: - Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        print("RegisterViewController viewDidLoad")
        print("Token: \(dataSingleton.token)")
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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    
    var dataSingleton : DataSingleton = DataSingleton.shared
    
}
// MARK: - IBAction
extension SingInViewController {
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func textFieldAction(_ sender: UITextField) {
        let _ = self.verifyCredentials(sender)
    }
    
    @IBAction func singInAction() {
        self.singInRequest()
    }
}

// MARK: - Public Func
extension SingInViewController {
    
}

// MARK: - Private Func
extension SingInViewController {
    private func verifyCredentials(_ sender : UITextField) -> Bool{
        if sender.tag == 0 {
            if !sender.hasText {
                self.emailValidateLable.isHidden = false
                return false
            } else {
                self.emailValidateLable.isHidden = true
            }
        } else {
            if !sender.hasText {
                self.passwordValidateLable.isHidden = false
                return false
            } else {
                self.passwordValidateLable.isHidden = true
            }
        }
        return true
    }
    
    private func singInRequest(){
        self.showLoading()
        if !self.verifyCredentials(self.emailTextField) {
            NotificationBanner(title: "Campo Email Requerido", subtitle: "llenar campos",  style: .warning).show()
            self.hideLoading()
            return
        }
        
        if !self.verifyCredentials(self.passwordTextField) {
            NotificationBanner(title: "Campo Pasword Requerido", subtitle: "llenar campos",  style: .warning).show()
            self.hideLoading()
            return
        }
        print("Este seria el email: \(self.emailTextField.text!) password: \(self.passwordTextField.text!)")
        
        AF.request(
            Endpoints.postAuthLogin,
            method: .post,
            parameters: ReqLogin(email: self.emailTextField.text!, password: self.passwordTextField.text!),
            encoder: JSONParameterEncoder.default,
            headers: [
                "Authorization": "bearer \(self.dataSingleton.token)",
                "Accept" : "application/json",
                "Content-Type" : "application/json"
            ],
            requestModifier: {$0.timeoutInterval = 20}
        ).responseData { (response) in
            DispatchQueue.main.async { [self] in
                self.hideLoading()
                debugPrint(response)
                switch response.result{
                case .success(let data):
                    switch response.response?.statusCode {
                    case 200:
                        do {
                            let ResLogin = try JSONDecoder().decode(ResLoginRegister.self, from:Data(data))
                            self.dataSingleton.token = ResLogin.token
                            print("Token: \(self.dataSingleton.token)")
                            self.performSegue(withIdentifier: "segueMain", sender: nil)
                        } catch let error {
                            NotificationBanner(title: "", subtitle:error.localizedDescription,  style: .warning).show()
                        }
                    default:
                        do {
                            let ResLogin = try JSONDecoder().decode(ResError.self, from:Data(data))
                            NotificationBanner(title: "", subtitle:ResLogin.error,  style: .warning).show()
                        } catch let error {
                            NotificationBanner(title: "", subtitle: error.localizedDescription,  style: .warning).show()
                        }
                    }
                case .failure(let error):
                    NotificationBanner(title: "", subtitle: error.errorDescription,  style: .danger).show()
                }
            }
        }
    }
    
    private func showLoading() -> Void{
        self.loginButton.isHidden = true
        self.activityIndicator.startAnimating()
    }
    
    private func hideLoading() -> Void{
        self.loginButton.isHidden = false
        self.activityIndicator.stopAnimating()
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
        let _ = self.verifyCredentials(textField)
    }
}

