//
//  Endpoints.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 23/08/22.
//

import Foundation

struct Endpoints {
    static let domain = "https://platzi-tweets-backend.herokuapp.com/api/v1"
    static let postAuthLogin = "\(Endpoints.domain)/auth" 
    static let postAuthRegister = "\(Endpoints.domain)/register"
    static let getIndexTweets = "\(Endpoints.domain)/posts"
    static let postStoreTweet = "\(Endpoints.domain)/posts"
    static let deleteDestroyTweet = "\(Endpoints.domain)/posts/"
//    static let authLogin = "\(Endpoints.domain)/auth"
//    static let authLogin = "\(Endpoints.domain)/auth"
}
