//
//  MapViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 21/08/22.
//

import UIKit
import MapKit
import Alamofire
import NotificationBannerSwift

class MapViewController: UIViewController {
    // MARK: - Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("MapViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("MapViewController viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("MapViewController viewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("MapViewController viewWillDisappear")
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
extension MapViewController {
    
}

// MARK: - Public Func
extension MapViewController {
    
}

// MARK: - Private Func
extension MapViewController {
    
}

// MARK: - Services
extension MapViewController {
    
}

// MARK: - Other
extension MapViewController {
    
}


