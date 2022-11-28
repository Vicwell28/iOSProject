//
//  MainHotelViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 12/11/22.
//

import UIKit

class MainHotelViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageViewProfile.cornerRadius = self.imageViewProfile.frame.width / 2
        self.indicatorBudget.cornerRadius = self.indicatorBudget.frame.width / 2
    }
   
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: - Private Var / Let
    
    
    //MARK: - Public Var / Let
    
    
    //MARK: - @IBOutlet
    @IBOutlet weak var indicatorBudget: UILabel!
    @IBOutlet weak var imageViewProfile: UIImageView!
    @IBOutlet var collectionsLablesMenu: [UILabel]!
    @IBOutlet var collectionsImagesViewMenu: [UIImageView]!
    @IBOutlet weak var FavViewController: UIView!
    @IBOutlet weak var PromosViewController: UIView!
    @IBOutlet weak var CalendarViewController: UIView!
    @IBOutlet weak var MenuViewController: UIView!
    @IBOutlet weak var viewMenuNotification: UIView!
    @IBOutlet weak var viewMenuProfile: UIView!
}

//MARK: - @IBAction
extension MainHotelViewController {
    @IBAction func showMenuProfile(_ sender: UIButton) {
        self.viewMenuProfile.frame.origin.x = -self.viewMenuProfile.frame.width
        self.viewMenuProfile.superview!.isHidden = false
        UIView.animate(withDuration: 0.5) {
            self.viewMenuProfile.frame.origin.x = 0
        } completion: { Bool in
            
        }
    }
    
    @IBAction func closeMenuProfile(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.viewMenuProfile.frame.origin.x = -self.viewMenuProfile.frame.width
        } completion: { Bool in
            self.viewMenuProfile.superview!.isHidden = true
        }
    }
    
    @IBAction func closeMenuNotification(_ sender: UIButton) {
        let xMenu = self.viewMenuNotification.frame.origin.x
        UIView.animate(withDuration: 0.5) {
            self.viewMenuNotification.frame.origin.x += self.viewMenuNotification.frame.width
        } completion: { Bool in
            self.viewMenuNotification.superview!.isHidden = true
            self.viewMenuNotification.frame.origin.x = xMenu
        }
    }
    
    @IBAction func showMenuNotification(_ sender: UIButton) {
        let xMenu = self.viewMenuNotification.frame.origin.x
        self.viewMenuNotification.frame.origin.x += self.viewMenuNotification.frame.width
        self.viewMenuNotification.superview!.isHidden = false
        UIView.animate(withDuration: 0.5) {
            self.viewMenuNotification.frame.origin.x = xMenu
        } completion: { Bool in
            
        }
    }
    
    @IBAction func changeView(_ sender: UIButton) {
        FavViewController.isHidden = true
        PromosViewController.isHidden = true
        CalendarViewController.isHidden = true
        MenuViewController.isHidden = true
        
        self.collectionsLablesMenu.forEach { $0.textColor = UIColor(named: "AkaroaHotel")
        }
        
        self.collectionsImagesViewMenu.forEach { $0.tintColor = UIColor(named: "AkaroaHotel")
        }
        
        self.collectionsImagesViewMenu[sender.tag].tintColor = UIColor.white
        
        self.collectionsLablesMenu[sender.tag].textColor = UIColor.white
        

        
        switch sender.tag {
        case 0:
            MenuViewController.isHidden = false
            break;
        case 1:
            CalendarViewController.isHidden = false
            break;
        case 2:
            PromosViewController.isHidden = false
            break;
        default:
            FavViewController.isHidden = false
            break;
        }
    }
}
//MARK: - public func
extension MainHotelViewController {

}
//MARK: - Private func
extension MainHotelViewController {

}
//MARK: - Services
extension MainHotelViewController {

}
//MARK: - Other
extension MainHotelViewController {

}

