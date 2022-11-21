//
//  TipsRepository.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 03/11/22.
//

import Foundation

class TipsRepository {
    static public func index(compleation : @escaping (_ res : TipsResponse?, _ err : String?) -> Void) {
        ApiHelperMedics.request(endpoint: .tips) { data, err, response in
            DispatchQueue.main.async {
                if let data = data {
                    if let res = try? JSONDecoder().decode(TipsResponse.self, from: data) {
                        compleation(res, nil)
                    } else {
                        compleation(nil, "No se pudieron trare tips")
                    }
                } else {
                    compleation(nil, "No se pudieron trare tips")
                }
            }
        }
    }
    
    static public func store(body : TipsResponse,compleation : @escaping (_ res : [TipsResponse]?, _ err : String?) -> Void) {
       
    }
    
    static public func show(_ id : Int, compleation : @escaping (_ res : [TipsResponse]?, _ err : String?) -> Void) {
       
    }
    
    static public func update(_ id : Int, boyd : TipsResponse, compleation : @escaping (_ res : [TipsResponse]?, _ err : String?) -> Void) {
       
    }
    
    static public func destroy(_ id : Int, compleation : @escaping (_ res : [TipsResponse]?, _ err : String?) -> Void) {
       
    }
    
}
