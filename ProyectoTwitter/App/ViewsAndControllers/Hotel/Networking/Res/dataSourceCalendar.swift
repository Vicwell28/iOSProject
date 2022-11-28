//
//  dataSourceCalendar.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 26/11/22.
//

import Foundation

struct dataSourceCalendar : Codable {
    let dateCalendar : String
    let dataData : [dataSourceCalendarCell]
}

struct dataSourceCalendarCell : Codable {
    let date : String
    let image : String
    let desc : String
}
