//
//  ViewController.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 17.08.2022.
//

import UIKit
class ViewController: UIViewController {
   
    private var label = UILabel()
    private var button1 = UIButton()
    private var button2 = UIButton()
    private var button3 = UIButton()
    private var button4 = UIButton()
    private var button5 = UIButton()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        
        let safeArea = self.view.safeAreaInsets
        
        label.text = "Welcome Screen! Choose the game..."
        label.textColor = .black
        label.frame.size.width = self.view.frame.size.width
        label.numberOfLines = 0
        label.frame.size.height = 30
        label.center = self.view.center
        label.textAlignment = .center
        self.view.addSubview(label)
        
        let buttonWidth = CGFloat(250)
        let buttonHeight = CGFloat(30)
        let buttonDistance = CGFloat(20)
        
        button1.setTitle("Game 1 for Cat", for: .normal)
        button1.setTitle("Start", for: .selected)
        button1.setTitle("Start", for: .highlighted)
        button1.frame.size.width = buttonWidth
        button1.frame.size.height = buttonHeight
        button1.backgroundColor = .systemPurple
        button1.frame.origin.x = self.view.frame.size.width/2 - safeArea.left - (button1.frame.size.width/2)
        button1.frame.origin.y = label.frame.origin.y + button1.frame.size.height + buttonDistance
        self.view.addSubview(button1)
        
        button2.setTitle("Game 2 Add view", for: .normal)
        button2.setTitle("Start", for: .selected)
        button2.setTitle("Start", for: .highlighted)
        button2.frame.size.width = buttonWidth
        button2.frame.size.height = buttonHeight
        button2.backgroundColor = .systemPurple
        button2.frame.origin.x = self.view.frame.size.width/2 - safeArea.left - (button2.frame.size.width/2)
        button2.frame.origin.y = button1.frame.origin.y + button2.frame.size.height + buttonDistance
        self.view.addSubview(button2)
        
        button3.setTitle("Game 3 ball side", for: .normal)
        button3.setTitle("Start", for: .selected)
        button3.setTitle("Start", for: .highlighted)
        button3.frame.size.width = buttonWidth
        button3.frame.size.height = buttonHeight
        button3.backgroundColor = .systemPurple
        button3.frame.origin.x = self.view.frame.size.width/2 - safeArea.left - (button3.frame.size.width/2)
        button3.frame.origin.y = button2.frame.origin.y + button3.frame.size.height + buttonDistance
        self.view.addSubview(button3)
     
        button4.setTitle("Game random View color", for: .normal)
        button4.setTitle("Start", for: .selected)
        button4.setTitle("Start", for: .highlighted)
        button4.frame.size.width = buttonWidth
        button4.frame.size.height = buttonHeight
        button4.backgroundColor = .systemPurple
        button4.frame.origin.x = self.view.frame.size.width/2 - safeArea.left - (button4.frame.size.width/2)
        button4.frame.origin.y = button3.frame.origin.y + button4.frame.size.height + buttonDistance
        self.view.addSubview(button4)
     
        button5.setTitle("Game SHIPS", for: .normal)
        button5.setTitle("Start", for: .selected)
        button5.setTitle("Start", for: .highlighted)
        button5.frame.size.width = buttonWidth
        button5.frame.size.height = buttonHeight
        button5.backgroundColor = .systemPurple
        button5.frame.origin.x = self.view.frame.size.width/2 - safeArea.left - (button5.frame.size.width/2)
        button5.frame.origin.y = button4.frame.origin.y + button5.frame.size.height + buttonDistance
        self.view.addSubview(button5)
     
        button1.addTarget(self, action: #selector(pressButton1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(pressButton2), for: .touchUpInside)
        button3.addTarget(self, action: #selector(pressButton3), for: .touchUpInside)
        button4.addTarget(self, action: #selector(pressButton4), for: .touchUpInside)
        button5.addTarget(self, action: #selector(pressButton5), for: .touchUpInside)
    }
    
    @IBAction func pressButton1() {
        let vcGame1 = FirstGameVC()
        vcGame1.modalPresentationStyle = .fullScreen
//        vcGame1.color
        self.present(vcGame1, animated: true, completion: nil)
    }
    
    @IBAction func pressButton2() {
        let vcGame2 = SecondGameVC()
        vcGame2.modalPresentationStyle = .fullScreen
        self.present(vcGame2, animated: true, completion: nil)
    }
    
    @IBAction func pressButton3() {
        let vcGame3 = ThirdGameVC()
        vcGame3.modalPresentationStyle = .fullScreen
        self.present(vcGame3, animated: true, completion: nil)   
    }
    
    @IBAction func pressButton4() {
        let vcGame4 = FourthGameVC()
        vcGame4.modalPresentationStyle = .fullScreen
        self.present(vcGame4, animated: true, completion: nil)
    }
    
    @IBAction func pressButton5() {
        let vcGame5 = FifthGameShipsVC()
        vcGame5.modalPresentationStyle = .fullScreen
        self.present(vcGame5, animated: true, completion: nil)
    }
}



