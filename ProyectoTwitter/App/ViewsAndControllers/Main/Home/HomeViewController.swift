//
//  HomeViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 21/08/22.
//

import UIKit
import Alamofire
import NotificationBanner

class HomeViewController: UIViewController {
    // MARK: - Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeViewController viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("HomeViewController viewWillAppear")
        tableView.register(UINib(nibName: "MainOneTableViewCell", bundle: nil), forCellReuseIdentifier: "TweetTableViewCell")
        self.serviceGetIndexTweets()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.setContentOffset(CGPoint(x: 0, y: 0), animated: true);
        print("HomeViewController viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("HomeViewController viewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("HomeViewController viewWillDisappear")
    }
    
    var dataSingleton : DataSingleton = DataSingleton.shared
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    private func showLoading() -> Void{
        self.activityIndicator.startAnimating()
    }
    
    private func hideLoading() -> Void{
        self.activityIndicator.stopAnimating()
    }
    
    var dataSourceTwetts : [ResIndexTweets] = [ResIndexTweets]()
    @IBOutlet weak var tableView: UITableView!
}

// MARK: - IBAction
extension HomeViewController {
    
}

// MARK: - Public Func
extension HomeViewController {
    
}

// MARK: - Private Func
extension HomeViewController {
    
}

// MARK: - Services
extension HomeViewController {
    private func serviceGetIndexTweets(){
        self.showLoading()
        AF.request(
            Endpoints.getIndexTweets,
            method: .get,
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
                        do {
                            dataSourceTwetts = try JSONDecoder().decode([ResIndexTweets].self, from:Data(data))
                            self.tableView.reloadData()
                        } catch let error {
                            NotificationBanner(title: "", subtitle:error.localizedDescription,  style: .warning).show()
                        }
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

// MARK: - UITableViewDelegate
extension HomeViewController : UITableViewDelegate {
    
}
// MARK: - UITableViewDataSource
extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceTwetts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath)
        
        if let cell = cell as? MainOneTableViewCell {
            cell.setUpCell(
                text: self.dataSourceTwetts[indexPath.row].text,
                username: self.dataSourceTwetts[indexPath.row].author.nickname,
                author: self.dataSourceTwetts[indexPath.row].author.names,
                imageView: nil,
                hasVideo: self.dataSourceTwetts[indexPath.row].hasVideo,
                hasImage: self.dataSourceTwetts[indexPath.row].hasImage,
                hasLocation: self.dataSourceTwetts[indexPath.row].hasLocation,
                urlImage: self.dataSourceTwetts[indexPath.row].imageUrl
            )
        }
        return cell
    }
}

