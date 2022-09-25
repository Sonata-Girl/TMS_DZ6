//
//  FifthGameVC_Main.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 22.08.2022.
//

import UIKit

class FifthGameVC_Main: UIViewController {
    
    // MARK: Outlets
     @IBOutlet weak var submarine: UIImageView!
    @IBOutlet weak var oxygenBar: UIProgressView!
     @IBOutlet weak var ship: UIImageView!
     @IBOutlet weak var shark: UIImageView!
    
     @IBOutlet weak var bulletShot: UIImageView!
     @IBOutlet weak var bulletFind: UIImageView!
     @IBOutlet weak var octopus: UIImageView!
      
     @IBOutlet weak var downButton: UIImageView!
     @IBOutlet weak var upButton: UIImageView!
     
     @IBOutlet weak var waterView: UIImageView!
     @IBOutlet weak var bulletCountLabel: UILabel!
     @IBOutlet weak var scoresLabel: UILabel!
   
    
    // MARK: variables
    private var elementsDidLoad = false
    
    private let closeButton = CloseButton()
    private let labelGameOver = UILabel()
    private let labelBulletFound = UILabel()
   
    private var bulletsCount = 10
    private var scoresCount = 0
    
    private var startTime: Double = 0.0
    private var isStartTimeForBulletFound = false
    private var newYOctopus = CGFloat(1)
   
    private var timer = Timer()
    private var timerBullet = Timer()
    private var timerButton = Timer()
    
    private var timeInSec: Int = 0
   
    // MARK: LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        submarine.addShadow()
        shark.addShadow()
        ship.addShadow()
        bulletShot.addShadow()
        bulletFind.addShadow()
        octopus.addShadow()
        
        oxygenBar.setProgress(1, animated: true)
 
        view.addSubview(labelGameOver)
        labelGameOver.bringSubviewToFront(self.view)
        
        view.addSubview(labelBulletFound)
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
            if !self.isStartTimeForBulletFound {
                self.timeInSec = Int(Date().timeIntervalSinceReferenceDate -  self.startTime)
            }
            if self.timeInSec > 10 {
                self.isStartTimeForBulletFound = true
            }
            self.moveShark()
            self.moveShip()
            self.oxygenBar.progress -= 0.0005
            self.checkOxygen()
            self.moveOctopus()
            if self.isStartTimeForBulletFound {
                self.moveBulletFind()
                
            }
        }
        RunLoop.current.add(timer, forMode: .common)
    }
    
    private func setupUI() {
        self.view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -5),
            closeButton.heightAnchor.constraint(equalToConstant: 20), // высота
            closeButton.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !elementsDidLoad {
            let yStart = ship.frame.size.height + ship.frame.origin.y
            let yEnd = waterView.frame.size.height - octopus.frame.size.height
            
            octopus.frame.origin.y = CGFloat.random(in: yStart...yEnd)
            octopus.frame.origin.x = waterView.frame.size.width
 
    //        bulletFind.frame.origin.y = waterView.frame.size.height
            bulletFind.frame.origin.x = waterView.frame.size.width
            
            let bulletCountText = bulletCountLabel.text ?? ""
            let bctAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.link: "www.google.ru",
                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
            ]
            let attBulletCountText = NSAttributedString(string: bulletCountText, attributes: bctAttributes)
            bulletCountLabel.attributedText = attBulletCountText
            
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
            labelGameOver.font = UIFont(name: "ActionJackson", size: 120)
            labelGameOver.textColor = .white
            labelGameOver.tintColor = .red
            labelGameOver.isHidden = true
            
            labelGameOver.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                labelGameOver.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                labelGameOver.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            
            labelBulletFound.text = "+ 1 Bullet found"
            labelBulletFound.font = UIFont.systemFont(ofSize: 60)
            labelBulletFound.textColor = .orange
            labelBulletFound.isHidden = true
            
            labelBulletFound.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                labelBulletFound.leftAnchor.constraint(equalTo: waterView.leftAnchor)
//                labelBulletFound.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            
            bulletShot.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                bulletShot.topAnchor.constraint(equalTo: view.bottomAnchor),
//                bulletShot.bottomAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            elementsDidLoad = true
        }
    }

    // MARK: Functions
    private func moveShark() {
        UIView.animate(withDuration: 0.0001) {
            self.shark.frame.origin.x -= 1
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
//                if self.shark.image.
                self.stopTimerAndGameOver()
            }
        }
    }
        
    private func moveShip() {
        UIView.animate(withDuration: 0.0001) {
            self.ship.frame.origin.x -= 0.5
        }
        if self.ship.frame.origin.x + self.ship.frame.size.width < 0 {
            self.ship.frame.origin.x = self.waterView.frame.size.width + self.ship.frame.size.width
        }
        if self.ship.frame.origin.x <= self.submarine.frame.origin.x + self.submarine.frame.size.width - 50 {
            let rangeYSubmarineStart = self.submarine.frame.origin.y
            let rangeYSubmarineEnd = self.submarine.frame.origin.y + self.submarine.frame.size.height
            if rangeYSubmarineStart...rangeYSubmarineEnd ~= self.ship.frame.origin.y + self.ship.frame.size.height - 30 {
                self.stopTimerAndGameOver()
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
            if rangeYSubmarineStart...rangeYSubmarineEnd ~= self.octopus.frame.origin.y {
                self.stopTimerAndGameOver()
            }
        }
    }
    
    private func moveBulletFind() {
        UIView.animate(withDuration: 0.0001) {
            self.bulletFind.frame.origin.x -= 1
        }
        if self.bulletFind.frame.origin.x + self.bulletFind.frame.size.width < 0 {
            self.bulletFind.frame.origin.x = self.waterView.frame.size.width + self.bulletFind.frame.size.width
            self.startTime = Date().timeIntervalSinceReferenceDate
            self.isStartTimeForBulletFound = false
        } else {
            self.isStartTimeForBulletFound = true
        }
        if self.bulletFind.frame.origin.x <= self.submarine.frame.origin.x + self.submarine.frame.size.width - 20 {
            let rangeYSubmarineStart = self.submarine.frame.origin.y
            let rangeYSubmarineEnd = self.submarine.frame.origin.y + self.submarine.frame.size.height
            if rangeYSubmarineStart...rangeYSubmarineEnd ~= self.bulletFind.frame.origin.y + self.bulletFind.frame.size.height - 20 {
                self.startTime = Date().timeIntervalSinceReferenceDate
                self.isStartTimeForBulletFound = false
                self.bulletFind.frame.origin.x = self.waterView.frame.size.width
                self.bulletsCount += 1
                self.bulletCountLabel.text = String(bulletsCount)
                UIView.animate(withDuration: 3) {
                    self.labelBulletFound.isHidden = false
                    self.labelBulletFound.frame.size.width += 10
                } completion: { _ in
                    self.labelBulletFound.isHidden = true
                }
            }
        }
    }
    
    private func moveBulletShot() {
        
        UIView.animate(withDuration: 0.001) {
            self.bulletShot.frame.origin.x += 2
        }
        if self.bulletShot.frame.origin.x + self.bulletShot.frame.size.width > self.waterView.frame.size.width {
            self.timerBullet.invalidate()
            self.bulletShot.isHidden = true
        }
        if self.shark.frame.origin.x  <= self.bulletShot.frame.origin.x + self.bulletShot.frame.size.width {
            let rangeYBulletStart = self.shark.frame.origin.y
            let rangeYBulletEnd = self.shark.frame.origin.y + self.shark.frame.size.height
            if rangeYBulletStart...rangeYBulletEnd ~= self.bulletShot.center.y {
                self.timerBullet.invalidate()
                self.scoresCount += 1
                self.scoresLabel.text = String(scoresCount)
                UIView.animate(withDuration: 0.3) {
                    self.shark.image = UIImage(named: "explosion")
                    self.shark.frame.origin.x += 50
                    self.bulletShot.isHidden = true
                } completion: { _ in
                    self.shark.isHidden = true
                    self.shark.frame.origin.x = 2000
                    self.shark.isHidden = false
                    self.shark.image = UIImage(named: "sharks")
                }
            }
        }
        if  self.bulletShot.frame.origin.x + self.bulletShot.frame.size.width <= self.octopus.frame.origin.x + self.octopus.frame.size.width &&
            self.bulletShot.frame.origin.x + self.bulletShot.frame.size.width >=
            self.octopus.frame.origin.x  {
            let rangeYBulletStart = self.octopus.frame.origin.y
            let rangeYBulletEnd = self.octopus.frame.origin.y + self.octopus.frame.size.height
            if rangeYBulletStart...rangeYBulletEnd ~= self.bulletShot.center.y {
                self.timerBullet.invalidate()
                self.scoresCount += 1
                self.scoresLabel.text = String(scoresCount)
                UIView.animate(withDuration: 0.3) {
                    self.octopus.image = UIImage(named: "explosion")
                    self.octopus.frame.origin.x += 50
                    self.bulletShot.isHidden = true
                } completion: { _ in
                    self.octopus.isHidden = true
                    self.octopus.frame.origin.x = 2000
                    self.octopus.isHidden = false
                    self.octopus.image = UIImage(named: "octopus-2")
                }
            }
        }
    }
    
    private func stopTimerAndGameOver() {
        self.timer.invalidate()
        self.timerButton.invalidate()
        UIView.animate(withDuration: 0.3) {
            self.submarine.transform = self.submarine.transform.rotated(by: .pi)
            self.oxygenBar.transform = self.oxygenBar.transform.rotated(by: .pi)
            self.submarine.frame.origin.y = self.waterView.frame.size.height - self.submarine.frame.size.height
            self.oxygenBar.frame.origin.y = self.waterView.frame.size.height - self.oxygenBar.frame.size.height
            
            self.labelGameOver.isHidden = false
        }
       
    }
    
    private func checkOxygen() {
       
        if oxygenBar.progress == 0 {
            self.stopTimerAndGameOver()
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
    
    // MARK: IBActions
    @IBAction func closeButtonAction() {
//        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
        
    @IBAction func fireAction(_ sender: UIButton) {
        if bulletsCount > 0 {
            bulletShot.isHidden = false
            bulletsCount -= 1
            bulletCountLabel.text = String(bulletsCount)
            bulletShot.center = submarine.center
            bulletShot.frame.origin.x = submarine.frame.origin.x + submarine.frame.size.width
            timerBullet = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                self.moveBulletShot()
            }
        }
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
    

}

extension UIImageView {
      
    func addShadow() {
        layer.masksToBounds = false // распространение тени за пределы контейнера
        layer.shadowColor = UIColor.black.cgColor // цвет
        layer.shadowOpacity = 0.2 // прозрачность
        layer.shadowOffset = CGSize(width: 0, height: 10) // расположение. сдвиг тени
        layer.shadowRadius = 20 // это отступ от вью до конца тени
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath // кривые бизье  - рисовка фигур кривых каких то
        
        layer.shouldRasterize = true //  размытие тени
    }
    
}

