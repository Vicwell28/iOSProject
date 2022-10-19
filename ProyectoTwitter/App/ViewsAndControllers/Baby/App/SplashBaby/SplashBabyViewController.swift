//
//  SplashViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 03/09/22.
//

import UIKit
import Alamofire

class SplashBabyViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: - Private Var / Let
    private var datosUserBaby = BabyShared.shared
    private var dataSourceTips : [ResTips] = [ResTips]()
    private var dataSourceCalculator : [ResCalculator] = [ResCalculator]()
    private var dataSourceTutorials : [ResTutorials] = [ResTutorials]()
    private var dataSourceQuestion : [ResQuestion] = [ResQuestion]()
    
    //MARK: - Public Var / Let
    
    //MARK: - @IBOutlet
}


//MARK: - @IBAction
extension SplashBabyViewController {

}
//MARK: - public func
extension SplashBabyViewController {

}
//MARK: - Private func
extension SplashBabyViewController {

}
//MARK: - Services
extension SplashBabyViewController {
    
    private func serviceGetIndexTips(){
        AF.request(
            EndpoinstBaby.GetIndexTips,
            method: .get,
            headers: [
                "Authorization": "\(self.datosUserBaby.token)",
                "Accept" : "application/json",
                "Content-Type" : "application/json"
            ],
            requestModifier: {$0.timeoutInterval = 20}
        ).responseData { (response) in
            DispatchQueue.main.async { [self] in
                debugPrint(response)
                switch response.result{
                case .success(let data):
                    switch response.response?.statusCode {
                    case 200:
                        do {
                            self.dataSourceTips = try JSONDecoder().decode([ResTips].self, from: Data(data))
                        } catch let error {
                            print("Fallo codable: \(error.localizedDescription)")
                        }
                    default:
                        do {
                            let ResLogin = try JSONDecoder().decode(ResErrorBaby.self, from:Data(data))
                        } catch let error {
                            print("Fallo codable: \(error.localizedDescription)")
                        }
                    }
                case .failure(let error):
                    print("FALLO GRAVE: \(error.localizedDescription)")
                }
            }
        }
    }
    
    private func serviceGetIndexTutorials(){
        AF.request(
            EndpoinstBaby.GetIndexTips,
            method: .get,
            headers: [
                "Authorization": "\(self.datosUserBaby.token)",
                "Accept" : "application/json",
                "Content-Type" : "application/json"
            ],
            requestModifier: {$0.timeoutInterval = 20}
        ).responseData { (response) in
            DispatchQueue.main.async { [self] in
                debugPrint(response)
                switch response.result{
                case .success(let data):
                    switch response.response?.statusCode {
                    case 200:
                        do {
                            self.dataSourceTips = try JSONDecoder().decode([ResTips].self, from: Data(data))
                        } catch let error {
                            print("Fallo codable: \(error.localizedDescription)")
                        }
                    default:
                        do {
                            let ResLogin = try JSONDecoder().decode(ResErrorBaby.self, from:Data(data))
                        } catch let error {
                            print("Fallo codable: \(error.localizedDescription)")
                        }
                    }
                case .failure(let error):
                    print("FALLO GRAVE: \(error.localizedDescription)")
                }
            }
        }
    }
    
    private func serviceGetIndexCalculator(){
        AF.request(
            EndpoinstBaby.GetIndexTips,
            method: .get,
            headers: [
                "Authorization": "\(self.datosUserBaby.token)",
                "Accept" : "application/json",
                "Content-Type" : "application/json"
            ],
            requestModifier: {$0.timeoutInterval = 20}
        ).responseData { (response) in
            DispatchQueue.main.async { [self] in
                debugPrint(response)
                switch response.result{
                case .success(let data):
                    switch response.response?.statusCode {
                    case 200:
                        do {
                            self.dataSourceTips = try JSONDecoder().decode([ResTips].self, from: Data(data))
                        } catch let error {
                            print("Fallo codable: \(error.localizedDescription)")
                        }
                    default:
                        do {
                            let ResLogin = try JSONDecoder().decode(ResErrorBaby.self, from:Data(data))
                        } catch let error {
                            print("Fallo codable: \(error.localizedDescription)")
                        }
                    }
                case .failure(let error):
                    print("FALLO GRAVE: \(error.localizedDescription)")
                }
            }
        }
    }

    private func serviceGetIndexQuestion(){
        AF.request(
            EndpoinstBaby.GetIndexTips,
            method: .get,
            headers: [
                "Authorization": "\(self.datosUserBaby.token)",
                "Accept" : "application/json",
                "Content-Type" : "application/json"
            ],
            requestModifier: {$0.timeoutInterval = 20}
        ).responseData { (response) in
            DispatchQueue.main.async { [self] in
                debugPrint(response)
                switch response.result{
                case .success(let data):
                    switch response.response?.statusCode {
                    case 200:
                        do {
                            self.dataSourceTips = try JSONDecoder().decode([ResTips].self, from: Data(data))
                        } catch let error {
                            print("Fallo codable: \(error.localizedDescription)")
                        }
                    default:
                        do {
                            let ResLogin = try JSONDecoder().decode(ResErrorBaby.self, from:Data(data))
                        } catch let error {
                            print("Fallo codable: \(error.localizedDescription)")
                        }
                    }
                case .failure(let error):
                    print("FALLO GRAVE: \(error.localizedDescription)")
                }
            }
        }
    }
}
//MARK: - Other
extension SplashBabyViewController {

}
