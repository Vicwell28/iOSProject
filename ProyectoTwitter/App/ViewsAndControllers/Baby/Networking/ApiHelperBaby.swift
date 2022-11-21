//
//  ApiHelperBaby.swift
//  ProyectoTwitter
//
//  Created by vicwell28 on 04/11/22.
//

import Foundation


class ApiHelperBaby {
    
    enum ApiEnv {
        case qa
        case production
    }
    
    enum HTTPMethod : String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    typealias RequestCompletion = (_ data: Data?, _ err: String?, _ response: HTTPURLResponse?) -> Void
    
    static var env : ApiEnv = .qa
    
    private static let FORM_DATA_LINE_BREAK = "\r\n"

    static var url: String {
        switch env {
        case .qa:
            return "http://192.168.1.6:3333/api/v1/en/"
        case .production:
            return "http://192.168.1.6:3333/api/v1/en/"
        }
    }
    
    static func request(endpoint: ApiEndPoint, completion: @escaping RequestCompletion) {
        
        guard var request = buildRequestForEndpoint(endpoint) else {
            print("request could not being built!")
            return
        }
        
        print(":: New request to: \(request.url?.absoluteString ?? "NO URL!") ::\n")
        
        print("- METHOD:", request.httpMethod ?? "")
        
        print("- HEADERS:")
        
        for (key, value) in getHeadersForEndpoint(endpoint) {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        configureParameters(request: &request, endpoint)
        
        startRequestTask(request, endpoint: endpoint, completion: completion)
    }
    
    enum ApiEndPoint {
        case tips
        case login
        case refreshToken(_ refreshToken: String)
        case banners
        case curriculum
        case schedule
        case checkUserAppointment
        case getUserByPhone(_ number: String)
        case verifyCode(_ code: String, userId: Int)
        case scheduleAppointment(scheduleId: Int, userId: Int)
        case insertOrUpdatePatientOrAsssitant(id: Int?, isAssistant: Bool, isActive: Bool, name: String?, lastName: String?, phone: String?)
        case confirmAppointment(id: Int)
        case getPatients
        case getAssistants
        case getHospitals
    }
    
    
    static private func buildRequestForEndpoint(_ endpoint: ApiEndPoint) -> URLRequest? {
        
        guard let urlComp = URLComponents(string: url)?.url else {
            return nil
        }
        
        var request = URLRequest(url: URL(string: "\(urlComp)\(getPath(endpoint))")!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        request.httpMethod = getMethod(endpoint).rawValue
        
        return request
    }
    
    
    static func getPath(_ endpoint: ApiEndPoint) -> String {
        switch endpoint {
        case .tips:
            return "/en/tips/get"
        case .login:
            return "/auth/login"
        case .refreshToken:
            return "/auth/refresh"
        case .banners:
            return "/ads"
        case .curriculum:
            return "/medical-info/curriculum"
        case .schedule:
            return "/schedule"
        case .getUserByPhone(let number):
            return "/users/phone/\(number)"
        case .verifyCode:
            return "/auth/code"
        case .scheduleAppointment(let id, _):
            return "/appointments/reserve/\(id)"
        case .insertOrUpdatePatientOrAsssitant(let id, _, _, _, _, _):
            return "/users\(id != nil ? "/\(id!)" : "")"
        case .confirmAppointment(let id):
            return "/appointments/confirm/\(id)"
        case .getPatients:
            return "/users/patients"
        case .getAssistants:
            return "/users/assistants"
        case .getHospitals:
            return "/hospitals"
        case .checkUserAppointment:
            return ""
        }
    }
    

    static func getMethod(_ endpoint: ApiEndPoint) -> HTTPMethod {
        switch endpoint {
        case .tips:
            return .get
        case .login:
            return .post
        case .refreshToken:
            return .post
        case .banners:
            return .get
        case .curriculum:
            return .get
        case .schedule:
            return .get
        case .checkUserAppointment:
            return .get
        case .getUserByPhone:
            return .get
        case .verifyCode:
            return .post
        case .scheduleAppointment:
            return .post
        case .insertOrUpdatePatientOrAsssitant:
            return .post
        case .confirmAppointment:
            return .patch
        case .getPatients:
            return .get
        case .getAssistants:
            return .get
        case .getHospitals:
            return .get
        }
    }
    
    static func getHeadersForEndpoint(_ endpoint: ApiEndPoint) -> [String: String] {
        var headers: [String: String] = [:]
        
        switch endpoint {
        case .login, .refreshToken:
            return headers
        default:
//            if let token = LocalPreferences.shared.token {
//                headers.merge(dict: ["Authorization": "Bearer \(token)"])
//            }
            return headers
        }
    }
    
    
    static private func configureParameters(request: inout URLRequest, _ endpoint: ApiEndPoint) {

        if let bodyParameters = getBodyParameters(endpoint) {
            setBodyParams(urlRequest: &request, parameters: bodyParameters)
        }
        
        
        if let urlParameters = getURLParametersForEndpoint(endpoint) {
            setURLParams(urlRequest: &request, parameters: urlParameters)
        }
    }
    
    static func getBodyParameters(_ endpoint: ApiEndPoint) -> [String: Any]? {
        switch endpoint {
        case .login:
            return [:]
        case .refreshToken(let refreshToken):
            return ["refreshToken": refreshToken]
        case .verifyCode(let code, let userId):
            return ["id": userId, "code": code]
        case .scheduleAppointment(_, let userId):
            return ["userId": userId]
        case .insertOrUpdatePatientOrAsssitant(let id, let isAssistant, let isActive, let name, let lastName, let phone):
            return ["id": id as Any, "assistant": isAssistant, "active": isActive, "name": name as Any, "last_name": lastName as Any, "phone": phone as Any]
        default:
            return nil
        }
    }
    
    static private func setBodyParams(urlRequest: inout URLRequest, parameters: [String: Any]) {
        if let jsonAsData = try? JSONSerialization.data(withJSONObject: parameters) {
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
    }
    
    static func getURLParametersForEndpoint(_ endpoint: ApiEndPoint) -> [String: Any]? {
        switch endpoint {
        case .login:
            return nil
//        case .getAffectedCalendarData(let body):
//            return dataToDictionary(try! JSONEncoder().encode(body))
//        case .removeFromCalendar(let body):
//            return dataToDictionary(try! JSONEncoder().encode(body))
        default:
            return nil
        }
    }
    
    static private func setURLParams(urlRequest: inout URLRequest, parameters: [String: Any]) {
            
        guard let url = urlRequest.url else { return }
        
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            
            urlComponents.queryItems = [URLQueryItem]()
            
            for (key, value) in parameters {
                
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            
            urlRequest.url = urlComponents.url
        }
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded: charset-utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
    
    private static func startRequestTask(_ request: URLRequest, endpoint: ApiEndPoint, completion: @escaping RequestCompletion) {
        
        let task = URLSession.shared.dataTask(with: request) { (data, urlRes, err) in
            
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
    
    
    static private func handleRequestResponse(_ urlRes: HTTPURLResponse, data: Data?, forRequest req: URLRequest, ofEndpoint endpoint: ApiEndPoint, completion: @escaping RequestCompletion) {
        
        if data != nil {
            print("-- RESPONSE DATA for url \(req.url?.absoluteString ?? "NO URL!"):", String(data: data!, encoding: .utf8)!)
        }
        print("-- STATUS CODE: \(urlRes.statusCode)")
        
        switch urlRes.statusCode {
        case 200..<400:
            completion(data, nil, urlRes)
        case 401:
            switch endpoint {
            case .refreshToken(_):
                completion(nil, "Error al autentificar, reinstala la app para iniciar sesión nuevamente.", nil)
            default:
//                self.request(endpoint: .refreshToken(LocalPreferences.shared.refreshToken!), completion: completion)
                return
            }
        default:
            completion(data, "Error desconocido al conectar con el servidor", urlRes)
            return
        }
    }
    
}
