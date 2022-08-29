//
//  StarViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 21/08/22.
//

import UIKit
import Alamofire
import NotificationBanner

class StarViewController: UIViewController {
    // MARK: - Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        print("StarViewController viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("StarViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("StarViewController viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("StarViewController viewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("StarViewController viewWillDisappear")
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
extension StarViewController {
    
}

// MARK: - Public Func
extension StarViewController {
    
}

// MARK: - Private Func
extension StarViewController {
    
}

// MARK: - Services
extension StarViewController {
    
}

// MARK: - Other
extension StarViewController {
    
}

