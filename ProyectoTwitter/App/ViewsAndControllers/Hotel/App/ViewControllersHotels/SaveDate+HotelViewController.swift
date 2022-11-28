//
//  SaveDate+HotelViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 21/11/22.
//

import UIKit

extension UIViewController {
    @IBAction func dismissViewController() {
        self.dismiss(animated: true)
    }
}

class SaveDate_HotelViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: - Private Var / Let
    
   
    //MARK: - Public Var / Let
    
    //MARK: - @IBOutlet

    @IBAction func ShowTableview(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            self.funcShow(true, tableView: self.tableViewHabitaciones)
            self.funcShow(false, tableView: self.tableViewAdultos)
            self.funcShow(false, tableView: self.tableViewNinos)
            break
        case 1:
            self.funcShow(true, tableView: self.tableViewAdultos)
            self.funcShow(false, tableView: self.tableViewHabitaciones)
            self.funcShow(false, tableView: self.tableViewNinos)
            break
        default:
            self.funcShow(true, tableView: self.tableViewNinos)
            self.funcShow(false, tableView: self.tableViewHabitaciones)
            self.funcShow(false, tableView: self.tableViewAdultos)
            break
        }
    }
    @IBOutlet weak var tableViewNinos: UITableView!
    @IBOutlet weak var tableViewAdultos: UITableView!
    @IBOutlet weak var tableViewHabitaciones: UITableView!
    @IBOutlet var textFields: [UITextField]!
    
}
//MARK: - @IBAction
extension SaveDate_HotelViewController {

}
//MARK: - public func
extension SaveDate_HotelViewController {
    
}
//MARK: - Private func
extension SaveDate_HotelViewController {
    private func funcShow(_ show : Bool, tableView : UIView) -> Void {
        tableView.superview!.isHidden = tableView.superview!.isHidden && show ? false : true
    }
}
//MARK: - Services
extension SaveDate_HotelViewController {

}
//MARK: - UITableViewDelegate
extension SaveDate_HotelViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.textFields[tableView.tag].text = "\(indexPath.row)"
        self.funcShow(false, tableView: self.tableViewNinos)
        self.funcShow(false, tableView: self.tableViewHabitaciones)
        self.funcShow(false, tableView: self.tableViewAdultos)
        
    }

}

//MARK: - UITableViewDataSource
extension SaveDate_HotelViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.textAlignment = NSTextAlignment.center
        return cell
    }
}
