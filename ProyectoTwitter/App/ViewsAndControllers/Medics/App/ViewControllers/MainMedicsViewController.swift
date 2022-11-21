//
//  MainMedicsViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 03/11/22.
//

import UIKit

class MainMedicsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Entro a la pantalla")
        
        TipsRepository.index { res, err in
            print("Esta es la respuesta : \(String(describing: res)) Error : \(String(describing: err))")
        }
    }
    
}
