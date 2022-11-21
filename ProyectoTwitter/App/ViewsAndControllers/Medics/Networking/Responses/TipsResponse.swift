//
//  TipsResponse.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 16/11/22.
//

import Foundation

struct TipsResponse : Codable {
    let message : String
    let tips : [TipsResponseTips]
}

struct TipsResponseTips : Codable {
    let id : Int
    let title : String
    let active : String
    let description : String
    let image : String
}
