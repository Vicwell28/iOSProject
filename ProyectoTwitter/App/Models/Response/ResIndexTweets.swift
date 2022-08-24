//
//  ResIndexTweets.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 23/08/22.
//

import Foundation

struct ResIndexTweets : Codable {
    let id : String
    let author : User
    let imageUrl : String
    let text : String
    let videoUrl : String
    let location : Location
    let hasVideo : Bool
    let hasImage : Bool
    let hasLocation : Bool
    let createdAt : String
}
