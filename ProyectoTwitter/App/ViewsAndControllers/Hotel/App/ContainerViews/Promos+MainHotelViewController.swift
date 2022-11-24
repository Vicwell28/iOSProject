//
//  Promos+MainHotelViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 20/11/22.
//

import UIKit

class Promos_MainHotelViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "PromosMenu+TableViewCell", bundle: nil), forCellReuseIdentifier: "ManuMainCell")
    }
   
    //MARK: - Private Var / Let
    
    //MARK: - Public Var / Let
    
    @IBOutlet weak var tableView: UITableView!
    //MARK: - @IBOutlet
}
//MARK: - @IBAction
extension Promos_MainHotelViewController {

}
//MARK: - public func
extension Promos_MainHotelViewController {

}
//MARK: - Private func
extension Promos_MainHotelViewController {

}
//MARK: - Services
extension Promos_MainHotelViewController {

}
//MARK: - Other
extension Promos_MainHotelViewController {

}

//MARK: - UITableViewDataSource
extension Promos_MainHotelViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManuMainCell", for: indexPath)
        
        return cell
    }
}
//MARK: - UITableViewDelegate
extension Promos_MainHotelViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
