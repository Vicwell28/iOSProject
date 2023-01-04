//
//  TipsRepositoryBaby.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 07/12/22.
//

import Foundation

class TipsRepositoryBaby {
    
    typealias indexCompletion = (_ res : TipsResponse?, _ err : String?) -> Void
    typealias storeCompletion = (_ res : [TipsResponse]?, _ err : String?) -> Void
    typealias showCompletion = (_ res : [TipsResponse]?, _ err : String?) -> Void
    typealias updateCompletion = (_ res : [TipsResponse]?, _ err : String?) -> Void
    typealias destroyCompletion = (_ res : [TipsResponse]?, _ err : String?) -> Void
    

    static public func index(completion : @escaping indexCompletion ) -> Void {
        ApiHelperBaby.request(endpoint: .GetIndexImages) { data, err, response in
            handleResponseIndex(data: data, completion: completion)
        }
    }
    
    static public func store(body : TipsResponse, completion : @escaping storeCompletion) -> Void {
       
    }
    
    static public func show(_ id : Int, completion : @escaping showCompletion) -> Void{
       
    }
    
    static public func update(_ id : Int, body : TipsResponse, completion : @escaping updateCompletion) -> Void {
       
    }
    
    static public func destroy(_ id : Int, completion : @escaping destroyCompletion) -> Void {
       
    }
    
    
    
    
    
    static private func handleResponseIndex(data: Data?, completion: @escaping indexCompletion) -> Void {
        if let data = data {
            if let res = try? JSONDecoder().decode(TipsResponse.self, from: data) {
                completion(res, nil)
            } else {
                completion(nil, "Error en el servidor al cargar los datos")
            }
        } else {
            completion(nil, "Error al autentificar, reinstala la app para iniciar sesión nuevamente.")
        }
    }
    
    static private func handleResponseStore(data: Data?, completion: @escaping indexCompletion) -> Void {
        if let data = data {
            if let res = try? JSONDecoder().decode(TipsResponse.self, from: data) {
                completion(res, nil)
            } else {
                completion(nil, "Error en el servidor al cargar los datos")
            }
        } else {
            completion(nil, "Error al autentificar, reinstala la app para iniciar sesión nuevamente.")
        }
    }
    
    static private func handleResponseShow(data: Data?, completion: @escaping indexCompletion) -> Void {
        if let data = data {
            if let res = try? JSONDecoder().decode(TipsResponse.self, from: data) {
                completion(res, nil)
            } else {
                completion(nil, "Error en el servidor al cargar los datos")
            }
        } else {
            completion(nil, "Error al autentificar, reinstala la app para iniciar sesión nuevamente.")
        }
    }
    
    static private func handleResponseUpdate(data: Data?, completion: @escaping indexCompletion) -> Void {
        if let data = data {
            if let res = try? JSONDecoder().decode(TipsResponse.self, from: data) {
                completion(res, nil)
            } else {
                completion(nil, "Error en el servidor al cargar los datos")
            }
        } else {
            completion(nil, "Error al autentificar, reinstala la app para iniciar sesión nuevamente.")
        }
    }
    
    static private func handleResponseDestroy(data: Data?, completion: @escaping indexCompletion) -> Void {
        if let data = data {
            if let res = try? JSONDecoder().decode(TipsResponse.self, from: data) {
                completion(res, nil)
            } else {
                completion(nil, "Error en el servidor al cargar los datos")
            }
        } else {
            completion(nil, "Error al autentificar, reinstala la app para iniciar sesión nuevamente.")
        }
    }
    
}
