//
//  Fav+MainHotelViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 20/11/22.
//

import UIKit

class Fav_MainHotelViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Private Var / Let
    
    //MARK: - Public Var / Let
    
    //MARK: - @IBOutlet

}

//MARK: - @IBAction
extension Fav_MainHotelViewController {

}
//MARK: - public func
extension Fav_MainHotelViewController {

}
//MARK: - Private func
extension Fav_MainHotelViewController {

}
//MARK: - Services
extension Fav_MainHotelViewController {

}

//MARK: - UICollectionViewDelegate
extension Fav_MainHotelViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCellCollection", for: indexPath)
    
    
        return cell
    }
    

}

//MARK: - UICollectionViewDelegate
extension Fav_MainHotelViewController : UICollectionViewDelegate {

}
