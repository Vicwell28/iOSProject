//
//  AddViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 21/08/22.
//

import UIKit

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
extension AddViewController {
    
}

// MARK: - Public Func
extension AddViewController {
    
}

// MARK: - Private Func
extension AddViewController {
    
}

// MARK: - Services
extension AddViewController {
    
}

// MARK: - Other
extension AddViewController {
    
}

