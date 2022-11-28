//
//  CalendarMenu+TableViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 24/11/22.
//

import UIKit

class CalendarMenu_TableViewController: UITableViewController {
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        return 60
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 60))
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = self.dataSource[section].dateCalendar
        label.font = .boldSystemFont(ofSize: 20)
        headerView.addSubview(label)
        return headerView
    }
    //MARK: - Private Var / Let
    
    //MARK: - Public Var / Let
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
    //MARK: - @IBOutlet
}

//MARK: - @IBAction
extension PinCodeViewController {

}
//MARK: - public func
extension PinCodeViewController {

}
//MARK: - Private func
extension PinCodeViewController {

}
//MARK: - Services
extension PinCodeViewController {

}
//MARK: - Other
extension PinCodeViewController {

}
