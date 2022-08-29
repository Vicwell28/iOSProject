//
//  MainTabBarViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 20/08/22.
//

import UIKit
import Alamofire
import NotificationBanner

class MainTabBarViewController: UITabBarController {
    // MARK: - Override Func
    let viewImage = UIView()
    var lables : [UILabel] = [UILabel]()
    var imagesViews : [UIImageView] = [UIImageView]()
    var anteriorLable = 0

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setUp()
    }
    
    private func setUp() -> Void {
        let imagesImages = ["house.fill", "star.fill", "plus", "location.fill", "person.fill"]
        let textText = ["Home", "Star", "Add", "Map", "Profile"]
        self.drawItems(5, images: imagesImages, titles: textText)
        self.lables[anteriorLable].textColor = .white
        self.imagesViews[anteriorLable].tintColor = .white
    }
    
    private func drawItems(_ item : Int, images : [String], titles : [String]) -> Void {
        
        
        let view = UIView(frame: CGRect(x: self.view.frame.size.width/2-self.view.frame.size.width*0.92/2, y: self.view.frame.size.height-90, width: self.view.frame.size.width*0.92, height: 60))
        view.backgroundColor = .white
        view.cornerRadius = 18
        self.view.addSubview(view)
        
        viewImage.frame = CGRect(x: 0, y: 0, width: view.frame.size.width/Double(item), height: view.frame.size.height)
        viewImage.cornerRadius = viewImage.frame.width/4
        viewImage.backgroundColor = .black
        
        view.addSubview(viewImage)
        
        var widthViewButton : Double = 0.0
        
        for i in 0..<item {
            let viewButon1 = UIView(frame: CGRect(x: widthViewButton, y: 0, width: view.frame.size.width/Double(item), height: view.frame.size.height))
            view.addSubview(viewButon1)
            widthViewButton += view.frame.size.width/Double(item)
            
            let imageView1 = UIImageView(frame: CGRect(x: viewButon1.frame.size.width/2-viewButon1.frame.size.height*0.7/2, y: 0, width: viewButon1.frame.size.height*0.7, height: viewButon1.frame.size.height*0.7))
            imageView1.image = UIImage(systemName: images[i])
            imageView1.tintColor = .black
            imageView1.contentMode = .scaleAspectFit
            viewButon1.addSubview(imageView1)
            self.imagesViews.append(imageView1)
            
            let lable1 = UILabel(frame: CGRect(x: 0, y: imageView1.frame.size.height, width: viewButon1.frame.size.width, height: viewButon1.frame.size.height*0.3))
            lable1.text = titles[i]
            lable1.textAlignment = .center
            self.lables.append(lable1)
            viewButon1.addSubview(lable1)
            
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: viewButon1.frame.size.width, height: viewButon1.frame.size.height))
            button.tag = i
            viewButon1.addSubview(button)
            
            button.addTarget(self, action: #selector(selectIndexButton(sender:)), for: .touchUpInside)
        }
    }
    
    @objc private func selectIndexButton(sender : UIButton){
        selectedIndex = sender.tag
        self.lables[self.anteriorLable].textColor = .black
        self.imagesViews[self.anteriorLable].tintColor = .black
        self.anteriorLable = sender.tag
        if let xView = sender.superview?.frame.origin.x {
            UIView.animate(withDuration: 0.5) {
                self.viewImage.frame = CGRect(x: xView, y: self.viewImage.frame.origin.y, width: self.viewImage.frame.size.width, height: self.viewImage.frame.size.height)
            } completion: { Bool in
                self.lables[sender.tag].textColor = .white
                self.imagesViews[sender.tag].tintColor = .white
            }
        }
    }
    
}

// MARK: - IBAction
extension MainTabBarViewController {
    
}

// MARK: - Public Func
extension MainTabBarViewController {
    
}

// MARK: - Private Func
extension MainTabBarViewController {
    
}

// MARK: - Services
extension MainTabBarViewController {
    
}

// MARK: - Other
extension MainTabBarViewController {
    
}



