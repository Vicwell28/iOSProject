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
        
        NotificationCenter.default.addObserver(self, selector: #selector(SingUpViewController.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SingUpViewController.keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
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

        NotificationCenter.default.removeObserver(self, name: SingUpViewController.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: SingUpViewController.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - @IBOutlet
    private let defaults = UserDefaults.standard
    private var dataSingleton : DataSingleton = DataSingleton.shared
    var activeField: UITextField?
    @IBOutlet weak var singUpButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var textFieldsCollection: [UITextField]!
    @IBOutlet var lablesAlertCollection: [UILabel]!
    
}

// MARK: - IBAction
extension SingUpViewController {
    @IBAction func TapGesture(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func verifyData(_ sender: UITextField) {
        let _ = verifyCredentials(sender)
    }
    
    @IBAction func singUpAction() {
        self.singInRequest()
    }
}

// MARK: - Public Func
extension SingUpViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }

        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        self.scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)

            if let activeField = activeField {
                var aRect = self.view.frame;
                aRect.size.height -= keyboardSize.height+activeField.frame.size.height;
                
                if !aRect.contains(activeField.superview!.frame.origin) {
                let scrollPoint = CGPoint(x: 0, y: activeField.superview!.frame.origin.y-keyboardSize.height)
                    self.scrollView.setContentOffset(scrollPoint, animated: true)
                }
            }
       }

       @objc func keyboardWillHide(notification: NSNotification) {
           let contentInset:UIEdgeInsets = UIEdgeInsets.zero
           self.scrollView.contentInset = contentInset
       }
}

// MARK: - Private Func
extension SingUpViewController {
    private func verifyCredentials(_ sender : UITextField) -> Bool{
        if let indexElement = self.textFieldsCollection.firstIndex(of: sender) {
            if !self.textFieldsCollection[indexElement].hasText{
                self.lablesAlertCollection[indexElement].isHidden = false
                return false
            } else {
                self.lablesAlertCollection[indexElement].isHidden = true
            }
        }
        return true
    }
    
    private func singInRequest(){
        if !self.verifyCredentials(self.textFieldsCollection[0]) {
            NotificationBanner(title: "Campo Email Requerido", subtitle: "llenar campos",  style: .warning).show()
            return
        }
        
        if !self.verifyCredentials(self.textFieldsCollection[1]) {
            NotificationBanner(title: "Campo Pasword Requerido", subtitle: "llenar campos",  style: .warning).show()
            return
        }
        
        if !self.verifyCredentials(self.textFieldsCollection[2]) {
            NotificationBanner(title: "Campo Email Requerido", subtitle: "llenar campos",  style: .warning).show()
            return
        }
        
        if !self.verifyCredentials(self.textFieldsCollection[3]) {
            NotificationBanner(title: "Campo Pasword Requerido", subtitle: "llenar campos",  style: .warning).show()
            return
        }
        
        if self.textFieldsCollection[2].text! != self.textFieldsCollection[3].text! {
            NotificationBanner(title: "", subtitle: "Password dont match",  style: .danger).show()
            return
        }
        
        self.servicePostSingUp()
    }
    
    private func showLoading() -> Void{
        self.singUpButton.isHidden = true
        self.activityIndicator.startAnimating()
    }

    private func hideLoading() -> Void{
        self.singUpButton.isHidden = false
        self.activityIndicator.stopAnimating()
    }
}

// MARK: - Services
extension SingUpViewController {
    private func servicePostSingUp(){
        self.showLoading()
        AF.request(
            Endpoints.postAuthRegister,
            method: .post,
            parameters: ReqRegister(email: self.textFieldsCollection[1].text!, password: self.textFieldsCollection[2].text!, names: self.textFieldsCollection[0].text!),
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
                            self.defaults.set(ResLogin.token, forKey: "token")
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

// MARK: - Other
extension SingUpViewController {
    
}

// MARK: - Other
extension SingUpViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            self.textFieldsCollection[1].becomeFirstResponder()
        } else if textField.tag == 1 {
            self.textFieldsCollection[2].becomeFirstResponder()
        } else if textField.tag == 2 {
            self.textFieldsCollection[3].becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let _ = verifyCredentials(textField)
        activeField = nil
    }
}

