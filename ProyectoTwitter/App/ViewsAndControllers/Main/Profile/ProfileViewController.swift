//
//  ProfileViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 21/08/22.
//

import UIKit
import Alamofire
import NotificationBanner

class ProfileViewController: UIViewController {
    // MARK: - Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ProfileViewController viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ProfileViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ProfileViewController viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ProfileViewController viewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ProfileViewController viewWillDisappear")
    }
    
    var dataSingleton : DataSingleton = DataSingleton.shared
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    private func showLoading() -> Void{
        self.activityIndicator.startAnimating()
    }
    
    private func hideLoading() -> Void{
        self.activityIndicator.stopAnimating()
    }
}
// MARK: - IBAction
extension ProfileViewController {
    
}

// MARK: - Public Func
extension ProfileViewController {
    
}

// MARK: - Private Func
extension ProfileViewController {
    
}

// MARK: - Services
extension ProfileViewController {
    
}

// MARK: - Other
extension ProfileViewController {
    
}

