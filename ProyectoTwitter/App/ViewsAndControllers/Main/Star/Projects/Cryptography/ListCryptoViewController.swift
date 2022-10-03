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
        self.dataSourceHashCopy = self.dataSourceHash
    }
    
    //MARK: - Private Var / Let
    private let dataSourceHash : [structCellHash] = [
        structCellHash(id: 1, title: "MD5", desc: "MD5 SIMETRICO"),
        structCellHash(id: 2, title: "SH1-1", desc: "SH1 SIMETRICO"),
        structCellHash(id: 3, title: "SHA-224", desc: "SH1 SIMETRICO"),
        structCellHash(id: 4, title: "SHA-256", desc: "SH1 SIMETRICO"),
        structCellHash(id: 5, title: "SHA-384", desc: "SH1 SIMETRICO"),
        structCellHash(id: 6, title: "SHA-512", desc: "SH1 SIMETRICO")
    ]
    private var dataSourceHashCopy : [structCellHash] = [structCellHash]()
    //MARK: - Public Var / Let


    @IBAction func searchTextField(_ sender: UITextField) {
        if let text = sender.text {
            if text.isEmpty {
                self.dataSourceHashCopy = self.dataSourceHash
            } else {
                self.dataSourceHashCopy = self.dataSourceHash.filter({ $0.title.lowercased().contains(text) })
            }
        } else {
            self.dataSourceHashCopy = self.dataSourceHash
        }
        self.tableView.reloadData()
    }
    
    //MARK: - @IBOutlet

    @IBOutlet weak var tableView: UITableView!
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
        return self.dataSourceHashCopy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        if let cell = cell as? CryptoCellTableViewCell {
            cell.titleCellLable.text = self.dataSourceHashCopy[indexPath.row].title
            cell.desCellLable.text = self.dataSourceHashCopy[indexPath.row].desc
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detalleCrypto", sender: nil)
        print("Elemento Seleccionado \(indexPath.row)")
    }
}
