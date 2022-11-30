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
    @IBAction func veryCredAction(_ sender: UIButton) {
        if let text = self.textFieldEmail.text, text.isEmpty {
            self.showAlert(campo: "Correo Electronico")
            return
        }
        
        if let text = self.textFieldPassword.text, text.isEmpty {
            self.showAlert(campo: "Contrase;a")
            return
        }
        
        self.showViewControllerLoaderHotel()
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { Timer in
            self.dismissViewControllerLoaderHotel()
            self.performSegue(withIdentifier: "segueLoginToCode", sender: nil)
        }
    }
}
//MARK: - public func
extension SingInHotelViewController {
    private func showAlert(campo : String) -> Void {
        let alertController = UIAlertController(title: "", message: "Campo Requerido \(campo)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
        
        self.present(alertController, animated: true)
    }

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
