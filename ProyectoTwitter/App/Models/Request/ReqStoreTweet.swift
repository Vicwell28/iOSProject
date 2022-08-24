//
//  ReqStoreTweet.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 23/08/22.
//

import Foundation

struct ReqStoreTweet : Codable {
    let text : String
    let imageUrl : String
    let videoUrl : String
    let location : Location
}
