//
//  PaymentMethod+HotelViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 21/11/22.
//

import UIKit

class PaymentMethod_HotelViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "MetodoPago+TableViewCell", bundle: nil), forCellReuseIdentifier: "cellMetodoDePago")
    }
    //MARK: - Private Var / Let
    
    //MARK: - Public Var / Let
    private let dataSourceImages : [String] = ["masterCardHotel", "visaHotel", "paypalHotel"]
    
    //MARK: - @IBOutlet

    @IBOutlet weak var tableView: UITableView!
}

//MARK: - @IBAction
extension PaymentMethod_HotelViewController {

}
//MARK: - public func
extension PaymentMethod_HotelViewController {

}
//MARK: - Private func
extension PaymentMethod_HotelViewController {

}
//MARK: - Services
extension PaymentMethod_HotelViewController {

}
//MARK: - Other
extension PaymentMethod_HotelViewController  : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMetodoDePago", for: indexPath) as? MetodoPago_TableViewCell
        cell!.imageViewPaymentMethod.image = UIImage(named: self.dataSourceImages[indexPath.row])
        return cell!
    }
    

}

//MARK: - Other
extension PaymentMethod_HotelViewController  : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showViewControllerLoaderHotel()
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { Timer in
            self.dismissViewControllerLoaderHotel()
            self.performSegue(withIdentifier: "segueQr", sender: nil)
        }
        
    }

}
