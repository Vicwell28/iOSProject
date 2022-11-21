//
//  ResTutorial.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 05/10/22.
//

import Foundation

struct ResTutorials : Codable {
    let message : String
    let tutorials : [ResTutorialsArray]
}

struct ResTutorialsArray : Codable {
    let id : Int
    let title : String
    let key : String
    let description : String
    let keyd : String
    let image : String
    let url : String
}
