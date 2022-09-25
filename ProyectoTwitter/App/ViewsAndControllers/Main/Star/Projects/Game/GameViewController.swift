//
//  GameViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 31/08/22.
//

import UIKit
import Alamofire
import NotificationBannerSwift

class GameViewController: UIViewController {
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.disableButtons()
    }
    
    //MARK: - Private Var / Let
    
    
    //MARK: - Public Var / Let
    private var timer = Timer()
    private var timerGamePro = Timer()
    private var time : Int = 3;
    private var timeGame : Float = 1.0
    private var indexTouch : Int = 0
    private var indexShow : Int = 0
    private var totalPosition : Int = 0
    private var PositionGame : [Int] = [Int]()
    
    //MARK: - @IBOutlet
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var indicatorGameLable: UILabel!
    @IBOutlet var buttonsCollection: [UIControl]!
    @IBOutlet weak var bestLable: UILabel!
}

//MARK: - @IBAction
extension GameViewController {
    @IBAction func clickButton(_ sender: UIControl) {
        sender.backgroundColor = UIColor.white
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { Timer in sender.backgroundColor = UIColor.lightGray }
        
        if sender.tag == self.PositionGame[self.indexTouch] {
            self.indexTouch += 1
                        
            if self.indexTouch >= self.PositionGame.count {
                self.timeGame -= self.timeGame > 0.1 ? 0.05 : 0
                print(timeGame)
                self.indexTouch = 0
                self.disableButtons()
                self.startGame()
            }
            
        } else {
            self.bestLable.text = "Best: \(self.PositionGame.count)"
            self.playButton.isHidden = false
            self.indicatorGameLable.isHidden = false
            self.indicatorGameLable.text = "You lost!"
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { Timer in self.indicatorGameLable.isHidden = true }
            NotificationBanner(title: "", subtitle: "",  style: .danger).show()
            self.disableButtons()
            self.timeGame = 1.0
            self.indexTouch = 0
            self.PositionGame.removeAll()
        }
    }
    
    @IBAction func playGameAction(_ sender: UIButton) {
        self.playButton.isHidden = true
        if self.indicatorGameLable.isHidden {
            self.time = 3
            self.indicatorGameLable.text = "\(self.time)"
            self.indicatorGameLable.isHidden = false
        }
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if self.time == -1 {
            if !self.indicatorGameLable.isHidden {
                self.indicatorGameLable.isHidden = true
            }
            self.timer.invalidate()
            self.startGame()
        } else {
            self.indicatorGameLable.text = self.time == 0 ? "GO!" : "\(self.time)"
            self.time -= 1
        }
    }
}
//MARK: - public func
extension GameViewController {

}
//MARK: - Private func
extension GameViewController {
    private func startGame() -> Void {
        self.disableButtons()
        self.PositionGame.append(Int.random(in: 0..<4))
        print(self.PositionGame)
        self.totalPosition = self.PositionGame.count
        self.timerGamePro = Timer.scheduledTimer(timeInterval: TimeInterval(timeGame), target: self, selector: #selector(self.showPosition), userInfo: nil, repeats: true)
    }
    
    @objc func showPosition() {
        self.turnOFF()
    }
    
    @objc func turnOFF() {
        self.buttonsCollection.forEach { UIControl in
            UIControl.backgroundColor = UIColor.lightGray
        }
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.turnON), userInfo: nil, repeats: false)
    }
    
    @objc func turnON() {
        if indexShow < self.PositionGame.count {
            //sigue aumentando
            self.buttonsCollection[self.PositionGame[self.indexShow]].backgroundColor = UIColor.white
            self.indexShow += 1
        } else {
            //TERMINO SIGUE EL JUGADOR
            self.indexShow = 0
            self.timerGamePro.invalidate()
            self.enableButtons()
        }
    }
    
    private func enableButtons(){
        self.buttonsCollection.forEach { UIControl in UIControl.isEnabled = true }
    }
    
    private func disableButtons(){
        self.buttonsCollection.forEach { UIControl in UIControl.isEnabled = false }
    }
}
//MARK: - Services
extension GameViewController {

}
//MARK: - Other
extension GameViewController {

}
