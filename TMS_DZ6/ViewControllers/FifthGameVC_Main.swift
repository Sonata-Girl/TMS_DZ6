//
//  FifthGameVC_Main.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 22.08.2022.
//

import UIKit

class FifthGameVC_Main: UIViewController {

    private let closeButton = CloseButton()
    private let labelGameOver = UILabel()
    private let labelBulletFound = UILabel()
    private var bulletsCount = 0
    private var bulletsTimerCount = Date()
    
    @IBOutlet weak var submarine: UIImageView!    
    @IBOutlet weak var oxygenBar: UIProgressView!
    @IBOutlet weak var ship: UIImageView!
    @IBOutlet weak var shark: UIImageView!
   
    @IBOutlet weak var bulletShot: UIImageView!
    @IBOutlet weak var bulletFind: UIImageView!
    @IBOutlet weak var octopus: UIImageView!
    private var newYOctopus = CGFloat(1)
    
    private var timer = Timer()
    private var timerLabel = Timer()
    private var timerSlowly = Timer()
    private var timerButton = Timer()
    
    @IBOutlet weak var downButton: UIImageView!
    @IBOutlet weak var upButton: UIImageView!
    
    @IBOutlet weak var waterView: UIImageView!
    @IBOutlet weak var bulletCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        oxygenBar.setProgress(1, animated: true)
 
        view.addSubview(labelGameOver)
//        labelGameOver.center = self.view.center
//        labelGameOver.frame.origin.x = 200
//        labelGameOver.frame.origin.y = 200
        labelGameOver.bringSubviewToFront(self.view)
        
        view.addSubview(labelBulletFound)
//        labelBulletFound.center = self.view.center
//        labelBulletFound.frame.origin.x = 200
//        labelBulletFound.frame.origin.y = 200
        labelBulletFound.bringSubviewToFront(self.view)
       
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)

        let upTap = UITapGestureRecognizer(target: self, action: #selector(upTapAction))
        upButton.addGestureRecognizer(upTap)
        
        let upLongTap = UILongPressGestureRecognizer(target: self, action: #selector(upLongTapAction))
        upButton.addGestureRecognizer(upLongTap)
       
        let downTap = UITapGestureRecognizer(target: self, action: #selector(downTapAction))
        downButton.addGestureRecognizer(downTap)
       
        let downLongTap = UILongPressGestureRecognizer(target: self, action: #selector(downLongTapAction))
        downButton.addGestureRecognizer(downLongTap)
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            self.moveShark()
            self.moveShip()
            self.oxygenBar.progress -= 0.0005
            self.checkOxygen()
            self.moveOctopus()
        }
        DispatchSourceTimer.schedule(<#T##self: DispatchSourceTimer##DispatchSourceTimer#>)
        timerSlowly = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
//            if bulletsTimerCount - Date() > 10 {
                self.moveBulletFind()
//            }
        }
            
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let yStart = ship.frame.size.height + ship.frame.origin.y
        let yEnd = waterView.frame.size.height - octopus.frame.size.height
        
        octopus.frame.origin.y = CGFloat.random(in: yStart...yEnd)
        octopus.frame.origin.x = waterView.frame.size.width
        
        bulletShot.frame.origin.y = waterView.frame.size.height
        bulletShot.frame.origin.x = waterView.frame.size.width
       
//        bulletFind.frame.origin.y = waterView.frame.size.height
        bulletFind.frame.origin.x = waterView.frame.size.width
        
    
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        //  как задавать констрейнты constraints
        // сверху справа слева = по 100 и height 20
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -5),
            closeButton.heightAnchor.constraint(equalToConstant: 20), // высота
            closeButton.widthAnchor.constraint(equalToConstant: 20)
        ])
    
        labelGameOver.text = "GAME OVER"
        labelGameOver.font = UIFont.systemFont(ofSize: 120)
        labelGameOver.textColor = .white
        labelGameOver.tintColor = .red
        labelGameOver.isHidden = true
        
        labelGameOver.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelGameOver.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelGameOver.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        labelBulletFound.text = "+ 1 Bullet found"
        labelBulletFound.font = UIFont.systemFont(ofSize: 80)
        labelBulletFound.textColor = .yellow
        labelBulletFound.isHidden = true
        
        labelBulletFound.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelBulletFound.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelBulletFound.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    
    private func moveShark() {
        UIView.animate(withDuration: 0.0001) {
            self.shark.frame.origin.x -= 2
        }
        if self.shark.frame.origin.x + self.shark.frame.size.width < 0 {
            self.shark.frame.origin.x = self.waterView.frame.size.width + self.shark.frame.size.width
            let yStart = self.ship.frame.size.height + self.ship.frame.origin.y
            let yEnd = self.waterView.frame.size.height - self.shark.frame.size.height
            
            self.shark.frame.origin.y = CGFloat.random(in: yStart...yEnd)
        }
        if self.shark.frame.origin.x <= self.submarine.frame.origin.x + self.submarine.frame.size.width - 10 {
            let rangeYSubmarineStart = self.submarine.frame.origin.y
            let rangeYSubmarineEnd = self.submarine.frame.origin.y + self.submarine.frame.size.height
            if rangeYSubmarineStart...rangeYSubmarineEnd ~= self.shark.frame.origin.y + 40 {
//                self.stopTimerAndGameOver()
            }
        }
    }
        
    private func moveShip() {
        UIView.animate(withDuration: 0.0001) {
            self.ship.frame.origin.x -= 1
        }
        if self.ship.frame.origin.x + self.ship.frame.size.width < 0 {
            self.ship.frame.origin.x = self.waterView.frame.size.width + self.ship.frame.size.width
        }
        if self.ship.frame.origin.x <= self.submarine.frame.origin.x + self.submarine.frame.size.width - 50 {
            let rangeYSubmarineStart = self.submarine.frame.origin.y
            let rangeYSubmarineEnd = self.submarine.frame.origin.y + self.submarine.frame.size.height
            if rangeYSubmarineStart...rangeYSubmarineEnd ~= self.ship.frame.origin.y + self.ship.frame.size.height - 30 {
//                self.stopTimerAndGameOver()
            }
        }
    }
    
    private func moveOctopus() {
        if Int(self.octopus.frame.origin.y) <= Int(self.ship.frame.origin.y) + Int(self.ship.frame.size.height) {
            self.newYOctopus = 0.5
        }
        if Int(self.octopus.frame.origin.y) + Int(self.octopus.frame.size.height) >= Int(self.waterView.frame.size.height) {
            self.newYOctopus = -0.5
        }

        UIView.animate(withDuration: 0.0001) {
            self.octopus.frame.origin.x -= 1.5
            self.octopus.frame.origin.y = self.octopus.frame.origin.y + self.newYOctopus
        }
        if self.octopus.frame.origin.x + self.octopus.frame.size.width < 0 {
            self.octopus.frame.origin.x = self.waterView.frame.size.width + self.octopus.frame.size.width
            let yStart = self.ship.frame.size.height + self.ship.frame.origin.y
            let yEnd = self.waterView.frame.size.height - self.octopus.frame.size.height
            
            self.octopus.frame.origin.y = CGFloat.random(in: yStart...yEnd)
        }
        if self.octopus.frame.origin.x <= self.submarine.frame.origin.x + self.submarine.frame.size.width - 10 {
            let rangeYSubmarineStart = self.submarine.frame.origin.y
            let rangeYSubmarineEnd = self.submarine.frame.origin.y + self.submarine.frame.size.height
            if rangeYSubmarineStart...rangeYSubmarineEnd ~= self.octopus.frame.origin.y + 40 {
//                self.stopTimerAndGameOver()
            }
        }
    }
    
    private func moveBulletFind() {
        UIView.animate(withDuration: 0.0001) {
            self.bulletFind.frame.origin.x -= 1
        }
        if self.bulletFind.frame.origin.x + self.bulletFind.frame.size.width < 0 {
            self.bulletFind.frame.origin.x = self.waterView.frame.size.width + self.bulletFind.frame.size.width
            self.bulletsTimerCount += 1
        }
        if self.bulletFind.frame.origin.x <= self.submarine.frame.origin.x + self.submarine.frame.size.width - 20 {
            let rangeYSubmarineStart = self.submarine.frame.origin.y
            let rangeYSubmarineEnd = self.submarine.frame.origin.y + self.submarine.frame.size.height
            if rangeYSubmarineStart...rangeYSubmarineEnd ~= self.bulletFind.frame.origin.y + self.bulletFind.frame.size.height - 20 {
                self.bulletsTimerCount += 1
                self.bulletFind.frame.origin.x = self.waterView.frame.size.width
                self.bulletsCount += 1
                self.bulletCountLabel.text = String(bulletsCount)
                UIView.animate(withDuration: 0.3, delay: 1) {
                    self.labelBulletFound.isHidden = false
                } completion: { _ in
                    self.labelBulletFound.isHidden = true
                }

            }
        }
    }
    
    private func stopTimerAndGameOver() {
        self.timer.invalidate()
        self.timerSlowly.invalidate()
        self.timerButton.invalidate()
        UIView.animate(withDuration: 0.3) {
            self.submarine.transform = self.submarine.transform.rotated(by: .pi)
            self.oxygenBar.transform = self.oxygenBar.transform.rotated(by: .pi)
            self.submarine.frame.origin.y = self.waterView.frame.size.height - self.submarine.frame.size.height
            self.oxygenBar.frame.origin.y = self.waterView.frame.size.height - self.oxygenBar.frame.size.height
            
            self.labelGameOver.isHidden = false
        }
       
    }
    
    
    @IBAction func closeButtonAction() {
//        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func upLongTapAction(sender: UILongPressGestureRecognizer) {
        if sender.state == .began  {
            timerButton = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                guard self.checkOriginSubmarine(multiplier: -3) else {return}
                self.submarine.frame.origin.y -= 3
                self.oxygenBar.frame.origin.y -= 3
            }
            timerButton.fire()
        } else if sender.state == .ended || sender.state == .cancelled {
            timerButton.invalidate()
        }
    }
    
    @objc func upTapAction() {
        guard checkOriginSubmarine(multiplier: -10) else {return}
        self.submarine.frame.origin.y -= 10
        self.oxygenBar.frame.origin.y -= 10
      
    }
    
    @objc func downLongTapAction(sender: UILongPressGestureRecognizer) {
        if sender.state == .began  {
            timerButton = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                guard self.checkOriginSubmarine(multiplier: 3) else {return}
                self.submarine.frame.origin.y += 3
                self.oxygenBar.frame.origin.y += 3
            }
            timerButton.fire()
        } else if sender.state == .ended || sender.state == .cancelled {
            timerButton.invalidate()
        }
    }
    @objc func downTapAction() {
        guard checkOriginSubmarine(multiplier: 10) else {return}
        self.submarine.frame.origin.y += 10
        self.oxygenBar.frame.origin.y += 10

    }
    
    private func checkOxygen() {
       
        if oxygenBar.progress == 0 {
//            self.stopTimerAndGameOver()
        }
        let plusOxygenZone = self.ship.frame.origin.y + self.ship.frame.size.height
        let minusOxygenZone = self.waterView.frame.size.height - self.submarine.frame.size.height - 30
        let positionSubmarine = self.submarine.frame.origin.y
        
        if positionSubmarine <= plusOxygenZone {
            oxygenBar.progress += 0.003
        }
        
        if positionSubmarine >= minusOxygenZone {
            oxygenBar.progress -= 0.001
        }
    }
    
    private func checkOriginSubmarine(multiplier: Int) -> Bool {
        let rangeYWaterStart = (self.ship.frame.origin.y + self.ship.frame.size.height)/2 + self.submarine.frame.size.height
        let rangeYWaterEnd = self.waterView.frame.size.height
        
        let positionSubmarine = self.submarine.frame.origin.y + self.submarine.frame.size.height

        if rangeYWaterStart...rangeYWaterEnd ~= positionSubmarine + CGFloat(multiplier) {
            return true
        }
        
        return false
    }
}
