//
//  ResQuestion.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 05/10/22.
//

import Foundation

struct ResQuestion : Codable {
    let message : String
    let questions : [ResQuestionArray]
}

struct ResQuestionArray : Codable {
    let id : Int
    let title : String
    let key : String
    let answers : [ResAnswerArray]
}
struct ResAnswerArray : Codable {
    let id : Int
    let question_id : String
    let key : String
    let correct : String
    let text : String
}
