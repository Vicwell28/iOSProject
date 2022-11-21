//
//  ResErrorBaby.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 05/10/22.
//

import Foundation

struct ResErrorBaby : Codable {
    let error : ResErrorMessageBaby
}

struct ResErrorMessageBaby : Codable {
    let message : String
}

