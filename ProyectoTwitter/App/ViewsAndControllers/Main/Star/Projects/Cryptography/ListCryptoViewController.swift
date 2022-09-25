//
//  ListCryptoViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 25/09/22.
//

import UIKit

class ListCryptoViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Private Var / Let
    
    //MARK: - Public Var / Let
    
    //MARK: - @IBOutlet

}

//MARK: - @IBAction
extension ListCryptoViewController {

}
//MARK: - public func
extension ListCryptoViewController {

}
//MARK: - Private func
extension ListCryptoViewController {

}
//MARK: - Services
extension ListCryptoViewController {

}
//MARK: - UITextFieldDelegate
extension ListCryptoViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - UITableViewDelegate , UITableViewDataSource
extension ListCryptoViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
//
//        // set the text from the data model
//        cell.textLabel?.text = self.animals[indexPath.row]
//
//        return cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detalleCrypto", sender: nil)
        print("Elemento Seleccionado \(indexPath.row)")
    }
}
