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
        print("Token: \(dataSingleton.token)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet var lablesAlertsCollection: [UILabel]!
    @IBOutlet var textFieldsCollection: [UITextField]!
    private var dataSingleton : DataSingleton = DataSingleton.shared
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
        if let indexElement = self.textFieldsCollection.firstIndex(of: sender) {
            if !self.textFieldsCollection[indexElement].hasText{
                self.lablesAlertsCollection[indexElement].isHidden = false
                return false
            } else {
                self.lablesAlertsCollection[indexElement].isHidden = true
            }
        }
        return true
    }
    
    private func singInRequest(){
        self.showLoading()
        
        if !self.verifyCredentials(self.textFieldsCollection[0]) {
            NotificationBanner(title: "Campo Email Requerido", subtitle: "llenar campos",  style: .warning).show()
            self.hideLoading()
            return
        }
        
        if !self.verifyCredentials(self.textFieldsCollection[1]) {
            NotificationBanner(title: "Campo Pasword Requerido", subtitle: "llenar campos",  style: .warning).show()
            self.hideLoading()
            return
        }
        
        print("Este seria el email: \(self.textFieldsCollection[0].text!) password: \(self.textFieldsCollection[1].text!)")
        self.servicePostLogin()
        
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
    private func servicePostLogin(){
        AF.request(
            Endpoints.postAuthLogin,
            method: .post,
            parameters: ReqLogin(email: self.textFieldsCollection[0].text!, password: self.textFieldsCollection[1].text!),
            encoder: JSONParameterEncoder.default,
            headers: [
                "Authorization": "\(self.dataSingleton.token)",
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
}


// MARK: - UITextFieldDelegate
extension SingInViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            self.textFieldsCollection[1].becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let _ = self.verifyCredentials(textField)
    }
}

