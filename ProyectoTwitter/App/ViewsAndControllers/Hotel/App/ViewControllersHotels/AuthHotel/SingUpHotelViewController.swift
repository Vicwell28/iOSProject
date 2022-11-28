//
//  SingUpViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 21/11/22.
//

import UIKit

class SingUpHotelViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
        viewImageProfile.cornerRadius = viewImageProfile.frame.width / 2
        // Do any additional setup after loading the view.
        
        self.scrollView.contentSize = CGSizeMake(0, self.buttonSingUp.frame.origin.y+self.buttonSingUp.frame.height+40)
    }
    
    //MARK: - Private Var / Let
    
    //MARK: - Public Var / Let
    
    

    //MARK: - @IBOutlet

    @IBOutlet var collectionsTextFields: [UITextField]!
    @IBOutlet weak var buttonSingUp: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewImageProfile: UIView!
}

//MARK: - @IBAction
extension SingUpHotelViewController {
    @IBAction func screenEdgeLeftAction(_ sender: UIScreenEdgePanGestureRecognizer) {
        self.dismiss(animated: true)
    }
}
//MARK: - public func
extension SingUpHotelViewController {

}
//MARK: - Private func
extension SingUpHotelViewController {

}
//MARK: - Services
extension SingUpHotelViewController {

}
//MARK: - UITextFieldDelegate
extension SingUpHotelViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.collectionsTextFields[0] {
            self.collectionsTextFields[1].becomeFirstResponder()
        } else if textField == self.collectionsTextFields[1] {
            self.collectionsTextFields[2].becomeFirstResponder()
        } else if textField == self.collectionsTextFields[2] {
            self.collectionsTextFields[3].becomeFirstResponder()
        } else if textField == self.collectionsTextFields[3] {
            self.collectionsTextFields[4].becomeFirstResponder()
        } else if textField == self.collectionsTextFields[4] {
            self.collectionsTextFields[5].becomeFirstResponder()
        } else if textField == self.collectionsTextFields[5] {
            self.collectionsTextFields[5].resignFirstResponder()
        }
        return true
    }
}
