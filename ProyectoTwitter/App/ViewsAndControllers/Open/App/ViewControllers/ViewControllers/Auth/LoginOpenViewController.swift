//
//  LoginOpenViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 20/01/23.
//

import UIKit

class LoginOpenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var textFieldDNI: UITextField!
    
    
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        sender.superview!.viewWithTag(40)!.isHidden = false
        
        if sender == self.textFieldDNI {
            let img : UIImageView = sender.superview!.viewWithTag(40) as! UIImageView
            if sender.text != nil && isValidEmail(sender.text!) {
                print("true")
                img.tintColor = .green
            } else {
                print("false")
                img.tintColor = .red
            }
        }
    }
    
    @IBAction func showPassDown(_ sender: UIButton) {
        self.textFieldPass.isSecureTextEntry = false
    }
    
    
    @IBAction func showPassUp(_ sender: UIButton) {
        self.textFieldPass.isSecureTextEntry = true
    }
    
    @IBOutlet weak var textFieldPass: UITextField!
    
    private func isValidEmail (_ email : String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").evaluate(with: email)
    }
}


extension LoginOpenViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField.text == nil || textField.text!.isEmpty {
            let myLable : UILabel = textField.superview!.viewWithTag(50) as! UILabel
            
            textField.superview!.bringSubviewToFront(myLable)
            
            UIView.animate(withDuration: 0.2) {
                myLable.transform = CGAffineTransform(translationX: -(myLable.frame.origin.x), y: -(textField.frame.height/2+myLable.frame.height/2))
                myLable.bringSubviewToFront(textField.superview!)
                myLable.backgroundColor = .white
                myLable.alpha = 1
                myLable.textColor = .black
            }
        }
        
        print("VA A ETAR EDITANDO")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TERMINO A ETAR EDITANDO")

        if textField.text == nil || textField.text!.isEmpty {
            print("ENTRO")
            let myLable : UILabel = textField.superview!.viewWithTag(50) as! UILabel
            
            textField.superview!.bringSubviewToFront(myLable)
            
            UIView.animate(withDuration: 0.2) {
                myLable.transform = CGAffineTransform(translationX: 0, y: 0)
                myLable.bringSubviewToFront(textField.superview!)
                myLable.alpha = 1
                myLable.textColor = .gray
                
            }
        }
        
        
        if textField.text == nil || textField.text!.isEmpty {
            textField.superview!.viewWithTag(40)!.isHidden = true
        }
        
        
    }
    
}
