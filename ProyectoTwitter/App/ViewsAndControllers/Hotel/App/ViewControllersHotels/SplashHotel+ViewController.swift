//
//  SplashHotel+ViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 25/11/22.
//

import UIKit

class SplashHotel_ViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.TimerImage = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { Timer in
            self.changeImageView()
        }
    }
    
    //MARK: - Private Var / Let
    
    //MARK: - Public Var / Let
    private var TimerImage : Timer = Timer()
    private var indexImageView : Int = 0
    private var indexImageViewVueltas : Int = 0
    private var imagesArray : [String] = ["sph_1", "sph_2", "sph_3", "sph_4", "sph_5", "sph_6", "sph_7"]
    
    //MARK: - @IBOutlet
    @IBOutlet weak var imageView: UIImageView!

    
}

//MARK: - @IBAction
extension SplashHotel_ViewController {

}
//MARK: - public func
extension SplashHotel_ViewController {

}
//MARK: - Private func
extension SplashHotel_ViewController {
    private func changeImageView(){
        if indexImageView == 7 {

            if self.indexImageViewVueltas == 10 {
                self.TimerImage.invalidate()
                performSegue(withIdentifier: "segueOnBardingHotel", sender: nil)
                return
            }
            
            self.indexImageViewVueltas += 1
            self.indexImageView = 0
        }
        self.imageView.image = UIImage(named: self.imagesArray[indexImageView])
        indexImageView += 1
    }
}
//MARK: - Services
extension SplashHotel_ViewController {

}
//MARK: - Other
extension SplashHotel_ViewController {

}
