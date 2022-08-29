//
//  AddViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 21/08/22.
//

import UIKit
import Alamofire
import NotificationBanner

class AddViewController: UIViewController {
    // MARK: - Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        print("AddViewController viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("AddViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("AddViewController viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("AddViewController viewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("AddViewController viewWillDisappear")
    }
    
    private var dataSingleton : DataSingleton = DataSingleton.shared
    
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var buttonsCollection: [UIButton]!
    
    private func showLoading() -> Void{
        buttonsCollection.forEach { Button in Button.isHidden = true; }
        self.activityIndicator.startAnimating()
    }
   
    private func hideLoading() -> Void{
        buttonsCollection.forEach { Button in Button.isHidden = false; }
        self.activityIndicator.stopAnimating()
    }
}
// MARK: - IBAction
extension AddViewController {
    @IBAction func addPostAction(_ sender: Any) {
        if self.tweetTextView.text.isEmpty {
            NotificationBanner(title: "", subtitle: "LLenar campo",  style: .warning).show()
            return
        }
        
        self.servicePostStoreTweet()
        
    }
    
    @IBAction func addImageAction(_ sender: Any) {
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}

// MARK: - Public Func
extension AddViewController {
    
}

// MARK: - Private Func
extension AddViewController {
    
}

// MARK: - Services
extension AddViewController {
    private func servicePostStoreTweet(){
        self.showLoading()
        AF.request(
            Endpoints.postStoreTweet,
            method: .post,
            parameters: ReqStoreTweet(text: self.tweetTextView.text, imageUrl: nil, videoUrl: nil, location: nil),
            encoder: JSONParameterEncoder.default,
            headers: [
                "Authorization": "\(self.dataSingleton.token)",
                "Accept" : "application/json",
                "Content-Type" : "application/json"
            ],
            requestModifier: {$0.timeoutInterval = 20}
        ).responseData { (response) in
            DispatchQueue.main.async { [self] in
                self.hideLoading()
                debugPrint(response)
                switch response.result{
                case .success(let data):
                    switch response.response?.statusCode {
                    case 200:
                            NotificationBanner(title: "", subtitle:"Se agrego el tweet",  style: .success).show()
                    default:
                        do {
                            let ResLogin = try JSONDecoder().decode(ResError.self, from:Data(data))
                            NotificationBanner(title: "", subtitle:ResLogin.error,  style: .warning).show()
                        } catch let error {
                            NotificationBanner(title: "", subtitle: error.localizedDescription,  style: .warning).show()
                        }
                    }
                case .failure(let error):
                    NotificationBanner(title: "", subtitle: error.errorDescription,  style: .danger).show()
                }
            }
        }
    }
}

// MARK: - Text
extension AddViewController : UITextViewDelegate {
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
}



