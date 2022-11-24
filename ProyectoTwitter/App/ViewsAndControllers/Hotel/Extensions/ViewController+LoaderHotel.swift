//
//  ViewController+LoaderHotel.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 12/11/22.
//

import Foundation
import UIKit

private var dataSourceIdsViewLoaders : [UIView] = [UIView]()

extension UIViewController {
    
    func showViewControllerLoaderHotel () {
        dataSourceIdsViewLoaders.append(UIView(frame: self.view.bounds))
        dataSourceIdsViewLoaders[0].backgroundColor = UIColor.black.withAlphaComponent(0.25)
        dataSourceIdsViewLoaders[0].tag = 333333333

        dataSourceIdsViewLoaders.append(UIView(frame: CGRect(
            x: dataSourceIdsViewLoaders[0].frame.width/2-dataSourceIdsViewLoaders[0].frame.width*0.80/2,
            y: dataSourceIdsViewLoaders[0].frame.height/2-dataSourceIdsViewLoaders[0].frame.width*0.50/4,
            width: dataSourceIdsViewLoaders[0].frame.width*0.80,
            height: dataSourceIdsViewLoaders[0].frame.width*0.50/2)))
        
        dataSourceIdsViewLoaders[1].backgroundColor = UIColor.white
        dataSourceIdsViewLoaders[1].cornerRadius = 20
        dataSourceIdsViewLoaders[1].tag = 333333333
        dataSourceIdsViewLoaders[0].addSubview(dataSourceIdsViewLoaders[1])
        
        dataSourceIdsViewLoaders.append( UILabel(frame: CGRect(
            x: 0,
            y: 0,
            width: dataSourceIdsViewLoaders[1].frame.width,
            height: dataSourceIdsViewLoaders[1].frame.height*0.50)))
        
        let lbl : UILabel = dataSourceIdsViewLoaders[2] as! UILabel
        lbl.text = "Cargando..."
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        dataSourceIdsViewLoaders[2].tag = 333333333
        
        dataSourceIdsViewLoaders.append(UIActivityIndicatorView(style: .large))
        let ac : UIActivityIndicatorView = dataSourceIdsViewLoaders[3] as! UIActivityIndicatorView
        ac.startAnimating()
        ac.frame = CGRect(
            x: 0,
            y: dataSourceIdsViewLoaders[1].frame.height*0.45,
            width: dataSourceIdsViewLoaders[1].frame.width,
            height: dataSourceIdsViewLoaders[1].frame.height*0.50)
        
        dataSourceIdsViewLoaders[3].tag = 333333333
        dataSourceIdsViewLoaders[1].addSubview(dataSourceIdsViewLoaders[2])
        dataSourceIdsViewLoaders[1].addSubview(dataSourceIdsViewLoaders[3])
        self.view.addSubview(dataSourceIdsViewLoaders[0])
        
        dataSourceIdsViewLoaders[0].alpha = 0

        UIView.animate(withDuration: 1) {
            dataSourceIdsViewLoaders[0].alpha = 1
        }
    }
    
    func dismissViewControllerLoaderHotel () {
        UIView.animate(withDuration: 1) {
            dataSourceIdsViewLoaders[0].alpha = 0
        } completion: { Bool in
            
            dataSourceIdsViewLoaders.forEach({ UIView in
                UIView.removeFromSuperview()
            })
            
            dataSourceIdsViewLoaders.removeAll()
            
            for i in 0..<self.view.subviews.count {
                if i < self.view.subviews.count {
                    let v = self.view.subviews[i]
                    if v.tag == 333333333 {
                        v.removeFromSuperview()
                    }
                }
            }
            
            print("ESTE ES EL TOTAL DE VISTAS \(self.view.subviews.count)")
        }
        
        
        
    }
    
}
