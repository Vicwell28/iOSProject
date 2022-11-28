//
//  Calendar+MenuHotelViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 20/11/22.
//

import UIKit

class Calendar_MainHotelViewController : UITableViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private var dataSource : [dataSourceCalendar] = [
        dataSourceCalendar(dateCalendar: "20/20/20", dataData: [
            dataSourceCalendarCell(date: "20/20/50", image: "imagen", desc: "desc"),
        ]),
        dataSourceCalendar(dateCalendar: "20/20/20", dataData: [
            dataSourceCalendarCell(date: "20/20/50", image: "imagen", desc: "desc"),
            dataSourceCalendarCell(date: "20/20/50", image: "imagen", desc: "desc"),
            dataSourceCalendarCell(date: "20/20/50", image: "imagen", desc: "desc"),
            dataSourceCalendarCell(date: "20/20/50", image: "imagen", desc: "desc")
        ]),
        dataSourceCalendar(dateCalendar: "20/20/20", dataData: [
            dataSourceCalendarCell(date: "20/20/50", image: "imagen", desc: "desc"),
            dataSourceCalendarCell(date: "20/20/50", image: "imagen", desc: "desc")
        ]),
        dataSourceCalendar(dateCalendar: "20/20/20", dataData: [
            dataSourceCalendarCell(date: "20/20/50", image: "imagen", desc: "desc"),
            dataSourceCalendarCell(date: "20/20/50", image: "imagen", desc: "desc"),
            dataSourceCalendarCell(date: "20/20/50", image: "imagen", desc: "desc")
        ]),
        dataSourceCalendar(dateCalendar: "20/20/20", dataData: [
            dataSourceCalendarCell(date: "20/20/50", image: "imagen", desc: "desc"),
        ]),
        dataSourceCalendar(dateCalendar: "20/20/20", dataData: [
            dataSourceCalendarCell(date: "20/20/50", image: "imagen", desc: "desc"),
            dataSourceCalendarCell(date: "20/20/50", image: "imagen", desc: "desc")
        ]),
        dataSourceCalendar(dateCalendar: "20/20/20", dataData: [
            dataSourceCalendarCell(date: "20/20/50", image: "imagen", desc: "desc"),
            dataSourceCalendarCell(date: "20/20/50", image: "imagen", desc: "desc"),
            dataSourceCalendarCell(date: "20/20/50", image: "imagen", desc: "desc"),
        ])
    ]
    
    //MARK: - Private Var / Let
    
    //MARK: - Public Var / Let
    
    
    
    //MARK: - @IBOutlet
}

//MARK: - @IBAction
extension Calendar_MainHotelViewController {

}
//MARK: - public func
extension Calendar_MainHotelViewController {

}
//MARK: - Private func
extension Calendar_MainHotelViewController {

}
//MARK: - Services
extension Calendar_MainHotelViewController {

}
//MARK: - Other
extension Calendar_MainHotelViewController {
   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.dataSource.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.dataSource[section].dataData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "estevaaserlacell", for: indexPath)
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.dataSource[section].dateCalendar
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
                
                let label = UILabel()
                label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
                label.text = "Notification Times"
                label.font = .systemFont(ofSize: 16)
                label.textColor = .yellow
                
                headerView.addSubview(label)
                
                return headerView
    }

    

}
