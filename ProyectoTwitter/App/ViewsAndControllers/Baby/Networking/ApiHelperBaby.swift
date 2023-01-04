//
//  ApiHelperBabyI.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 07/12/22.
//

import Foundation


class ApiHelperBaby {
    
    public typealias RequestCompletion = (_ data : Data?, _ err : String?, _ response : HTTPURLResponse?) -> Void
    
    private static var lan : ApiLanguage = .es
    
    private static var env : ApiEnv = .prod
    
    
    
    public enum ApiEndPointsRequest {
        case PostAuthLogin(email : String, password : String)
        case GetIndexImages
    }
    
    
    private enum ApiEnv {
        case localhost
        case qa
        case prod
    }
    
    private enum ApiLanguage {
        case en
        case es
        case fr
    }
    
   
    
    private static var langUrl : String {
        switch lan {
        case .es:
            return "es"
        case .en:
            return "en"
        case .fr:
            return "fr"
        }
    }
    
    
    
    private static var urlMain : String {
        switch env {
        case .localhost:
                return "http://192.168.1.55:3333/api/v1/"
        case .qa:
                return "https://hub-qa.solidusystems.mx/api/v1/"
        case .prod:
                return "https://api.inercitec.com/api/v1/"
        }
    }
    
    
    
    
    private static func getPath(_ endpoint : ApiEndPointsRequest) -> String {
        switch endpoint {
        case .PostAuthLogin:
            return "auth/\(langUrl)/login?device_type=movile"
        case .GetIndexImages:
            return "\(langUrl)/tutorials/get"
        }
    }
    
    
    
    
    static private func getMethod(_ endpoint : ApiEndPointsRequest) -> String {
        switch endpoint {
        case .PostAuthLogin:
            return  "POST"
        case .GetIndexImages:
            return "GET"
//        case .GetIndexImages:
//            return "PUT"
//        case .GetIndexImages:
//            return "PATCH"
//        case .GetIndexImages:
//            return "DELETE"
        }
    }
    
    
    
    
    private static func getHeaders(_ endpoint : ApiEndPointsRequest) -> [String : String] {
        
        var headers: [String: String] = [:]

        switch endpoint {
        case .GetIndexImages:
            return headers
        case .PostAuthLogin:
            headers.updateValue("Bearer ", forKey: "Authorization")
            return headers
        }
    }
    
    
    
    
    private static func getBodyParameters(_ endpoint : ApiEndPointsRequest) -> [String : Any]? {
        
        switch endpoint {
        case .PostAuthLogin(let email, let password):
            return ["email":email, "password":password]
        default:
            return nil
        }
    }
    

    
    
    private static func setBodyParams(_ urlRequest : inout URLRequest, parameters : [String : Any]){
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: parameters) {
            urlRequest.httpBody = jsonData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
    }
    
    
    
    
    public static func request(endpoint : ApiEndPointsRequest, completion : @escaping RequestCompletion) -> Void {
        
        guard var request = buildRequest(endpoint) else {
            return
        }
        
        print("/// - - - Method : \(request) - - - - ////")

        
        for(key, value) in getHeaders(endpoint) {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        
        if let body = getBodyParameters(endpoint) {
            setBodyParams(&request, parameters: body)
        }
        
        print("/// - - - Headers : \(request.headers) - - - - ////")
        print("/// - - - HttpBody : \(String(describing: request.httpBody)) - - - - ////")

        startRequestTask(request, endpoint: endpoint, completion: completion)
    }
    
    
    
    
    private static  func buildRequest(_ endpoint : ApiEndPointsRequest) -> URLRequest? {
        
        guard let url = URLComponents(string: urlMain) else {
            return nil
        }
        
        var request = URLRequest(url: URL(string: "\(url)\(getPath(endpoint))")!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
        
        request.httpMethod = getMethod(endpoint)
        
        print("/// - - - Method : \(getMethod(endpoint)) - - - - ////")
        
        
        return request
    }
    
    
    
    
    
    private static func startRequestTask(_ request : URLRequest, endpoint : ApiEndPointsRequest, completion : @escaping RequestCompletion) {
        
        let task = URLSession.shared.dataTask(with: request) { (data : Data?, urlRes : URLResponse?, err : Error?) in
            
            guard let urlRes = urlRes as? HTTPURLResponse else {
                print("-- NO RESPONSE for request. --")
                completion(nil, "No se pudo obtener la información del servidor", nil)
                return
            }
            
            if err != nil {
                print("1...")
                completion(nil, "No se pudo obtener la información del servidor", urlRes)
                return
            }
            
            self.handleRequestResponse(urlRes, data: data, forRequest: request, ofEndpoint: endpoint, completion: completion)
        }
        
        task.resume()
    }
    
    
    
    
    private static func handleRequestResponse(_ urlRes: HTTPURLResponse, data: Data?, forRequest req: URLRequest, ofEndpoint endpoint: ApiEndPointsRequest, completion: @escaping RequestCompletion) {
        
        if data != nil {
            print("-- RESPONSE DATA for url \(req.url?.absoluteString ?? "NO URL!"):", String(data: data!, encoding: .utf8)!)
        }
        
        print("-- STATUS CODE: \(urlRes.statusCode)")
        
        switch urlRes.statusCode {
        case 200..<400:
            completion(data, nil, urlRes)
        default:
            completion(data, "Error desconocido al conectar con el servidor", urlRes)
            return
        }
    }
}
