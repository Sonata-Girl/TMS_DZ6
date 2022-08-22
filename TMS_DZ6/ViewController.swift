//
//  ViewController.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 17.08.2022.
//

import UIKit
class ViewController: UIViewController {
   
    private var label = UILabel()
    private var buttonsGame = [GameButton]()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        
        let safeArea = self.view.safeAreaInsets
        let buttonDistance = CGFloat(20)
        let viewHalfWidth = self.view.frame.size.width/2
        
        label.text = "Welcome Screen! Choose the game..."
        label.textColor = .black
        label.frame.size.width = self.view.frame.size.width
        label.numberOfLines = 0
        label.frame.size.height = 30
        label.center = self.view.center
        label.textAlignment = .center
        self.view.addSubview(label)
       
        let button1 = GameButton()
        button1.setTitle("Game 1 for Cat", for: .normal)
        buttonsGame.append(button1)

        let button2 = GameButton()
        button2.setTitle("Game 2 Add view", for: .normal)
        button2.backgroundColor = .systemCyan
        buttonsGame.append(button2)
        
        let button3 = GameButton()
        button3.setTitle("Game 3 ball side", for: .normal)
        button3.backgroundColor = .systemBlue
        buttonsGame.append(button3)
        
        let button4 = GameButton()
        button4.setTitle("Game random View color", for: .normal)
        button4.backgroundColor = .systemFill
        buttonsGame.append(button4)

        let button5 = GameButton()
        button5.setTitle("Game SHIPS", for: .normal)
        button5.backgroundColor = .systemTeal
        buttonsGame.append(button5)

        let button6 = GameButton()
        button6.setTitle("Game add Balls for Tap", for: .normal)
        button6.backgroundColor = .systemMint
        buttonsGame.append(button6)

        let button7 = GameButton()
        button7.setTitle("Game Ball follow finger", for: .normal)
        button7.backgroundColor = .systemMint
        buttonsGame.append(button7)

        for (index, button) in buttonsGame.enumerated() {
            if index == 0 {
                button.frame.origin.x = viewHalfWidth - safeArea.left - (button.frame.size.width/2)
                button.frame.origin.y = label.frame.origin.y + button.frame.size.height + buttonDistance
                self.view.addSubview(button)
                continue
            }
            button.frame.origin.x = viewHalfWidth - safeArea.left - (button.frame.size.width/2)
            button.frame.origin.y = buttonsGame[index - 1].frame.origin.y + button.frame.size.height + buttonDistance
            self.view.addSubview(button)
        }
   
        button1.addTarget(self, action: #selector(pressButton1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(pressButton2), for: .touchUpInside)
        button3.addTarget(self, action: #selector(pressButton3), for: .touchUpInside)
        button4.addTarget(self, action: #selector(pressButton4), for: .touchUpInside)
        button5.addTarget(self, action: #selector(pressButton5), for: .touchUpInside)
        button6.addTarget(self, action: #selector(pressButton6), for: .touchUpInside)
        button7.addTarget(self, action: #selector(pressButton7), for: .touchUpInside)
    }
    
    @IBAction func pressButton1() {
        let vcGame1 = FirstGameVC()
//        vcGame1.modalPresentationStyle = .fullScreen
//        self.present(vcGame1, animated: true, completion: nil)
        self.navigationController?.pushViewController(vcGame1, animated: true)
    }
    
    @IBAction func pressButton2() {
        let vcGame2 = SecondGameVC()
//        vcGame2.modalPresentationStyle = .fullScreen
//        self.present(vcGame2, animated: true, completion: nil)
          self.navigationController?.pushViewController(vcGame2, animated: true)
    }
    
    @IBAction func pressButton3() {
        let vcGame3 = ThirdGameVC()
//        vcGame3.modalPresentationStyle = .fullScreen
//        self.present(vcGame3, animated: true, completion: nil)
        self.navigationController?.pushViewController(vcGame3, animated: true)
    }
    
    @IBAction func pressButton4() {
        let vcGame4 = FourthGameVC()
//        vcGame4.modalPresentationStyle = .fullScreen
//        self.present(vcGame4, animated: true, completion: nil)
        self.navigationController?.pushViewController(vcGame4, animated: true)
    }
    
    @IBAction func pressButton5() {
        let vcGame5 = FifthGameVC_Start()
//        vcGame5.modalPresentationStyle = .fullScreen
//        self.present(vcGame5, animated: true, completion: nil)
        self.navigationController?.pushViewController(vcGame5, animated: true)
    }
    
    @IBAction func pressButton6() {
        let vcGame6 = SixthGameVC()
//        vcGame5.modalPresentationStyle = .fullScreen
//        self.present(vcGame5, animated: true, completion: nil)
        self.navigationController?.pushViewController(vcGame6, animated: true)
    }
    
    @IBAction func pressButton7() {
        let vcGame7 = SeventhGameVC()
//        vcGame5.modalPresentationStyle = .fullScreen
//        self.present(vcGame5, animated: true, completion: nil)
        self.navigationController?.pushViewController(vcGame7, animated: true)
    }
}



