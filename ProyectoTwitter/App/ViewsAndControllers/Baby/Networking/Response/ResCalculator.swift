//
//  ResCalculator.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 05/10/22.
//

import Foundation

struct ResCalculator : Codable {
    let message : String
    let calculator_fields : [ResCalculatorArray]
}

struct ResCalculatorArray : Codable {
    let id : Int
    let title : String
    let key : String
    let description : String
    let keyd : String
}
