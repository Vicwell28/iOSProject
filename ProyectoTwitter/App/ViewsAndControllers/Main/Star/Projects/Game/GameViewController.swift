//
//  GameViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 31/08/22.
//

import UIKit

class GameViewController: UIViewController {
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Private Var / Let
    
    
    //MARK: - Public Var / Let
    private var timer = Timer()
    private var time : Int8 = 3;
    private var Position : [UInt8] = [UInt8]()
    private var PositionRandom : UInt8 = UInt8.random(in: 0..<4)
    
    //MARK: - @IBOutlet
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var indicatorGameLable: UILabel!
    @IBOutlet var buttonsCollection: [UIControl]!
}

//MARK: - @IBAction
extension GameViewController {
    @IBAction func clickButton(_ sender: UIControl) {
        print(sender.tag)
        self.buttonsCollection.forEach { UIControl in
            print(UIControl.tag)
        }
    }
    
    
    @IBAction func playGameAction(_ sender: UIButton) {
        if self.indicatorGameLable.isHidden {
            self.time = 3
            self.indicatorGameLable.text = "\(self.time)"
            self.indicatorGameLable.isHidden = false
        }
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
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
        self.buttonsCollection[Int(self.PositionRandom)].backgroundColor = UIColor.white
        print(self.PositionRandom)
    }
    
    private func GenerateOtherIndex() -> Void {
        
    }
    
    private func endGame() -> Void {
        
    }
}
//MARK: - Services
extension GameViewController {

}
//MARK: - Other
extension GameViewController {

}
