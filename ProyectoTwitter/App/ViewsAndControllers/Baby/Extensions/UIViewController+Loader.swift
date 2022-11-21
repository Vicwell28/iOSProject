//
//  UIViewController+Loader.swift
//  ProyectoTwitter
//
//  Created by vicwell28 on 04/11/22.
//

import Foundation
import UIKit

fileprivate var loaderView: UIView?

extension UIViewController {
    func showLoadingExtension() {
        loaderView = UIView(frame: self.view.bounds)
        loaderView!.tag = 123456
        loaderView!.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        let loaderView2 = UIView(frame: CGRect(
            x: loaderView!.frame.size.width/2-loaderView!.frame.size.width*0.70/2,
            y: loaderView!.frame.size.height/2-loaderView!.frame.size.width*0.40/2,
            width: loaderView!.frame.size.width*0.70,
            height: loaderView!.frame.size.width*0.40))
        
        loaderView2.layer.cornerRadius = 20;
        loaderView2.backgroundColor = UIColor.white.withAlphaComponent(0.8);
        
        loaderView!.addSubview(loaderView2)
        
        var indicator: UIActivityIndicatorView?
        indicator = UIActivityIndicatorView(style: .large)
        indicator!.color = UIColor.systemPink
        indicator!.center = loaderView!.center
        indicator!.startAnimating()
        loaderView!.addSubview(indicator!)
        
        self.view.addSubview(loaderView!)
        
        loaderView!.alpha = 0
        
        UIView.animate(withDuration: 1) {
            loaderView!.alpha = 1
        }
    }
    
    func hideLoadingExtension() {
        UIView.animate(withDuration: 1) {
            loaderView?.alpha = 0
        } completion: { Bool in
            loaderView?.removeFromSuperview()
            loaderView = nil
            for i in 0..<self.view.subviews.count {
                if i < self.view.subviews.count {
                    let v = self.view.subviews[i]
                    if v.tag == 123456 {
                        v.removeFromSuperview()
                    }
                }
            }
        }
    }
}
