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

 
    @IBOutlet weak var buttonSingUp: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewImageProfile: UIView!
}

//MARK: - @IBAction
extension SingUpHotelViewController {
    @IBAction func dismissViewAction() {
        self.dismiss(animated: true)
    }
    
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
//MARK: - Other
extension SingUpHotelViewController {

}
