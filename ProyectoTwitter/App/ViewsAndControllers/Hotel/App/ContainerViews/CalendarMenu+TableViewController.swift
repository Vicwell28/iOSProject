//
//  CalendarMenu+TableViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 24/11/22.
//

import UIKit

class CalendarMenu_TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    struct dataSourceCalendar : Codable {
        let dateCalendar : String
        let dataData : [dataSourceCalendarCell]
    }
    
    struct dataSourceCalendarCell : Codable {
        let date : String
        let image : String
        let desc : String
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
