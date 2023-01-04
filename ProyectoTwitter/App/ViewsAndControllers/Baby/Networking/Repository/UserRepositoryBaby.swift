//
//  UserRepository.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 07/12/22.
//

import Foundation

class UserRepositoryBaby {
    
    typealias LoginResponseCompletion = (_ res: ResAuthBaby?, _ err: String?) -> Void
    
    
    public func login(email : String, password : String, completion : @escaping LoginResponseCompletion){
        ApiHelperBaby.request(endpoint: .PostAuthLogin(email: "", password: "")) { data, err, response in
            if let data = data {
                if let res = try? JSONDecoder().decode(ResAuthBaby.self, from: data) {
                    completion(res, nil)
                } else {
                    completion(nil, "Error en el servidor al cargar los datos")
                }
            } else {
                completion(nil, "Error al autentificar, reinstala la app para iniciar sesión nuevamente.")
            }
        }
    }
    
    
    
    
    
    typealias indexCompletion = (_ res : TipsResponse?, _ err : String?) -> Void
    typealias storeCompletion = (_ res : [TipsResponse]?, _ err : String?) -> Void
    typealias showCompletion = (_ res : [TipsResponse]?, _ err : String?) -> Void
    typealias updateCompletion = (_ res : [TipsResponse]?, _ err : String?) -> Void
    typealias destroyCompletion = (_ res : [TipsResponse]?, _ err : String?) -> Void
    

    static public func index(completion : @escaping indexCompletion ) -> Void {
      
    }
    
    static public func store(body : TipsResponse, completion : @escaping storeCompletion) -> Void {
       
    }
    
    static public func show(_ id : Int, completion : @escaping showCompletion) -> Void{
       
    }
    
    static public func update(_ id : Int, body : TipsResponse, completion : @escaping updateCompletion) -> Void {
       
    }
    
    static public func destroy(_ id : Int, completion : @escaping destroyCompletion) -> Void {
       
    }
    
    
    
    
    
}
