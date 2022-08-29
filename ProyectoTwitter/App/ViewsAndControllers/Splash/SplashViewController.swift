//
//  SplashViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 29/08/22.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2) {
            print("Entro")
            self.swiftImageView.frame = CGRect(
                x: 0,
                y: 0,
                width: 1000,
                height: 1000)
        } completion: { Bool in
            print(Bool)
            print("Termino")
            //VERIFICAR CREDENCIALES
            self.verifyCredentials()
        }
    }
    
    private func verifyCredentials(){
        if let token = self.defaults.string(forKey: "token"){
            self.dataSingleton.token = token
            self.performSegue(withIdentifier: "segueMain", sender: nil)
        } else {
            self.performSegue(withIdentifier: "segueOnBoarding", sender: nil)
        }
    }
    
    
    @IBOutlet weak var swiftImageView: UIImageView!
    private let defaults = UserDefaults.standard
    private var dataSingleton : DataSingleton = DataSingleton.shared
}
