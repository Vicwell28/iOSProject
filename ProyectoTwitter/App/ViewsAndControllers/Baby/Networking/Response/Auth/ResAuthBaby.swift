//
//  ResAuth.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 07/12/22.
//

import Foundation

struct ResAuthBaby : Codable {
    let message : String
    let auth : ResAuthAuth
}


struct ResAuthAuth : Codable {
    let type : String
    let toekn : String
}
