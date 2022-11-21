//
//  ResTips.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 05/10/22.
//

import Foundation

struct ResTips : Codable {
    let message : String
    let tips : [ResTipsArray]
    
}

struct ResTipsArray : Codable {
    let id : Int
    let title : String
    let key : String
    let description : String
    let keyd : String
    let image : String
}
