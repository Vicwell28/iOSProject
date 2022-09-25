//
//  DetailCryptoViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 25/09/22.
//

import UIKit

class DetailCryptoViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Private Var / Let
    
    //MARK: - Public Var / Let
    
    //MARK: - @IBOutlet
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var textContentView: UITextView!
}

//MARK: - @IBAction
extension DetailCryptoViewController {
    @IBAction func selectFileAction(_ sender: UIButton) {
//        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let fileURL = documentsUrl.appendingPathComponent(filename).appendingPathExtension("doc")
//        do {
//            let data = try Data(contentsOf: tempLocalUrl) // not NSData !!
//            try data.write(to: fileURL, options: .atomic)
//        } catch {
//            print(error,"helooooooooooooooooo")
//        }
    }
    
    @IBAction func encryptAction(_ sender: UIButton) {
        
    }
    
    @IBAction func decryptAction(_ sender: UIButton) {
        
    }

}
//MARK: - public func
extension DetailCryptoViewController {

}
//MARK: - Private func
extension DetailCryptoViewController {

}
//MARK: - Services
extension DetailCryptoViewController {

}
//MARK: - Other
extension DetailCryptoViewController {

}
