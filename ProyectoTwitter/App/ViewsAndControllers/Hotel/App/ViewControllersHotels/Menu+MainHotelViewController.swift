//
//  Menu+MainHotelViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 20/11/22.
//

import UIKit

class Menu_MainHotelViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MenuMain+TableViewCell", bundle: nil), forCellReuseIdentifier: "ManuMainCell")
        
        
    }
    //MARK: - Private Var / Let
    
    //MARK: - Public Var / Let
    
    //MARK: - @IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
}

//self.showViewControllerLoaderHotel()
//Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { Timer in
//    self.dismissViewControllerLoaderHotel()
//    self.performSegue(withIdentifier: "segueMain", sender: nil)
//}



//MARK: - @IBAction
extension Menu_MainHotelViewController {
    
}
//MARK: - public func
extension Menu_MainHotelViewController {
    
}
//MARK: - Private func
extension Menu_MainHotelViewController {
    
}
//MARK: - Services
extension Menu_MainHotelViewController {
    
}
//MARK: - UITableViewDataSource
extension Menu_MainHotelViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManuMainCell", for: indexPath)
        
        return cell
    }
}
//MARK: - UITableViewDelegate
extension Menu_MainHotelViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        performSegue(withIdentifier: "segueDetailHotel", sender: nil)
    }
}
