//
//  MainBabyViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 03/09/22.
//

import UIKit

class MainBabyViewController: UIViewController {
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.drawTips()
        self.drawQuizzes()
        self.drawTutorials()
        self.drawCalculator()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    //MARK: - Private Var / Let
    private var indiceMenu : UInt8 = 0
    private var isShowMenu : Bool = false
    private var isDrawTips : Bool = false
    private var isDrawTutorials : Bool = false
    private var isDrawQuizzes : Bool = false
    private var isDrawCalculator : Bool = false

    //MARK: - Public Var / Let
    
    //MARK: - @IBOutlet
    
    //MENU
    @IBOutlet weak var tableViewMenu: UITableView!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var menuImv: UIImageView!

    //TIPS
    @IBOutlet weak var viewTip: UIView!
    @IBOutlet weak var imvTip: UIImageView!
    @IBOutlet weak var lblTip: UILabel!
    @IBOutlet weak var scrViewTip: UIScrollView!
    
    //TUTORIALS
    @IBOutlet weak var viewQuizze: UIView!
    @IBOutlet weak var imvQuizze: UIImageView!
    @IBOutlet weak var lblQuizze: UILabel!
    @IBOutlet weak var scrViewQuizze: UIScrollView!
    
    //QUIZZES
    @IBOutlet weak var viewTutorial: UIView!
    @IBOutlet weak var imvTutorial: UIImageView!
    @IBOutlet weak var lblTutorial: UILabel!
    @IBOutlet weak var scrViewTutorial: UIScrollView!
    
    //CALCULATOR
    @IBOutlet weak var viewCalculator: UIView!
    @IBOutlet weak var imvCalculator: UIImageView!
    @IBOutlet weak var lblCalculator: UILabel!
    @IBOutlet weak var scrViewCalculator: UIScrollView!
}
//MARK: - @IBAction
extension MainBabyViewController {
    @IBAction func selectTagAction(_ sender: UIButton) {
        self.viewTip.isHidden = true
        self.imvTip.image = UIImage(named: "inercia-m1-2")
        self.lblTip.textColor = UIColor(named: "White")
        self.scrViewTip.isHidden = true
        
        self.viewTutorial.isHidden = true
        self.imvTutorial.image = UIImage(named: "inercia-m2-2")
        self.lblTutorial.textColor = UIColor(named: "White")
        self.scrViewTutorial.isHidden = true
        
        self.viewQuizze.isHidden = true
        self.imvQuizze.image = UIImage(named: "inercia-m3-2")
        self.lblQuizze.textColor = UIColor(named: "White")
        self.scrViewQuizze.isHidden = true
        
        self.viewCalculator.isHidden = true
        self.imvCalculator.image = UIImage(named: "inercia-m4-2")
        self.lblCalculator.textColor = UIColor(named: "White")
        self.scrViewCalculator.isHidden = true
        
        switch sender.tag {
        case 0:
            self.viewTip.isHidden = false
            self.imvTip.image = UIImage(named: "inercia-m1-1")
            self.lblTip.textColor = UIColor(named: "Rosa")
            self.scrViewTip.isHidden = false
            self.menuImv.image = UIImage(named: "inercia-l1")
            self.indiceMenu = 0
            break
        case 1:
            self.viewTutorial.isHidden = false
            self.imvTutorial.image = UIImage(named: "inercia-m2-1")
            self.lblTutorial.textColor = UIColor(named: "MoradoPastel")
            self.menuImv.image = UIImage(named: "inercia-l2")
            self.scrViewTutorial.isHidden = false
            self.indiceMenu = 1
            break
        case 2:
            self.viewQuizze.isHidden = false
            self.imvQuizze.image = UIImage(named: "inercia-m3-1")
            self.lblQuizze.textColor = UIColor(named: "VerdeClaro")
            self.menuImv.image = UIImage(named: "inercia-l3")
            self.scrViewQuizze.isHidden = false
            self.indiceMenu = 2
            break
        case 3:
            self.viewCalculator.isHidden = false
            self.imvCalculator.image = UIImage(named: "inercia-m4-1")
            self.lblCalculator.textColor = UIColor(named: "Amarillo")
            self.menuImv.image = UIImage(named: "inercia-l4")
            self.scrViewCalculator.isHidden = false
            self.indiceMenu = 3
            break
        default:
            let _ = 0
        }
    }
    
    @IBAction func showMenuAction() {
        if self.isShowMenu {
            self.hideMenuFunc(imageName: "inercia-tm1-0")
        } else {
            switch self.indiceMenu {
            case 0:
                self.showMenuFunc(imageName: "inercia-tm1-1")
                break
            case 1:
                self.showMenuFunc(imageName: "inercia-tm1-2")
                break
            case 2:
                self.showMenuFunc(imageName: "inercia-tm1-3")
                break
            case 3:
                self.showMenuFunc(imageName: "inercia-tm1-4")
                break
            default:
                let _ = 0
            }
        }
    }
}
//MARK: - public func
extension MainBabyViewController {
    
}
//MARK: - Private func
extension MainBabyViewController {
    
    private func showMenuFunc(imageName : String) -> Void {
        self.isShowMenu = true
        self.tableViewMenu.isHidden = false
        self.menuBtn.setImage(UIImage(named: imageName), for: .normal)
    }
    
    private func hideMenuFunc(imageName : String) -> Void {
        self.isShowMenu = false
        self.tableViewMenu.isHidden = true
        self.menuBtn.setImage(UIImage(named: imageName), for: .normal)
    }
}

//MARK: - Private func tips
extension MainBabyViewController {
    private func drawTips(){
        if !self.isDrawTips {
            self.isDrawTips = true
            var posY : Float = 10.0
            
            for _ in 0...10 {
                let imv = UIImageView(frame: CGRect(x: self.view.frame.size.width/2-self.view.frame.size.width*0.95/2, y: CGFloat(posY), width: self.view.frame.size.width*0.95, height: self.view.frame.size.width*0.95))
                
                imv.image = UIImage(named: "inercia-ej1")
                
                posY += Float(imv.frame.size.height) + 20
                
                self.scrViewTip.addSubview(imv)
            }
            self.scrViewTip.contentSize = CGSize(width: 0.0, height: Double(posY))
        }
    }
}

//MARK: - Private func tutorials
extension MainBabyViewController {
    private func drawTutorials(){
//        if !self.isDrawTutorials {
//            self.isDrawTutorials = true
//            var posY : Float = 10.0
//
//            let imv = UIImageView(frame: CGRect(x: self.view.frame.size.width/2-self.view.frame.size.width*0.95/2, y: CGFloat(posY), width: self.view.frame.size.width*0.95, height: self.view.frame.size.width*0.95/2))
//            imv.image = UIImage(named: "inercia-ej2")
//
//            posY += imv.frame.size.height + 10
//
//            let title = UITextView(frame: CGRect(x: self.view.frame.size.width/2-self.view.frame.size.width*0.95/2, y: CGFloat(posY), width: self.view.frame.size.width*0.95, height: 10))
//            title.text = "Este va a ser el titulo para el video"
//            title = CGRect(x: self.view.frame.size.width/2-self.view.frame.size.width*0.95/2, y: CGFloat(posY), width: self.view.frame.size.width*0.95, height: title.contentSize.height)
//
//            let desc = UITextView(frame: CGRect(x: self.view.frame.size.width/2-self.view.frame.size.width*0.95/2, y: CGFloat(posY), width: self.view.frame.size.width*0.95, height: 10))
//            desc.text = "Este va a ser la descripion para el video"
//            desc = CGRect(x: self.view.frame.size.width/2-self.view.frame.size.width*0.95/2, y: CGFloat(posY), width: self.view.frame.size.width*0.95, height: title.contentSize.height)
//
//            self.scrViewTutorial.addSubview(imv)
//            self.scrViewTutorial.addSubview(title)
//            self.scrViewTutorial.addSubview(desc)
//        }
    }
}

//MARK: - Private func quizzes
extension MainBabyViewController {
    private func drawQuizzes(){
        if !self.isDrawQuizzes {
            self.isDrawQuizzes = true
            var _ : Float = 10.0
            
        }
    }
}

//MARK: - Private func calculator
extension MainBabyViewController {
    private func drawCalculator(){
        if !self.isDrawCalculator {
            self.isDrawCalculator = true
            var _ : Float = 10.0
            
        }
    }
}

//MARK: - Services
extension MainBabyViewController {
    
}
//MARK: - UITableViewDataSource
extension MainBabyViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        return cell
    }
}

//MARK: - UITableViewDataSource
extension MainBabyViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Index: \(indexPath.row)")
        
        performSegue(withIdentifier: "SegueLogin", sender: nil)
    }
}

