//
//  ViewController.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 17.08.2022.
//

import UIKit

// / / / / / / / / / / / / / / / / / / // / / /   FIRS GAME
//class ViewController: UIViewController {
//
//    let buttonForCircle = UIButton()
//    let button = UIButton()
//    var arrayView = [UIView]()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        buttonForCircle.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
//        buttonForCircle.frame.size.width = 50
//        buttonForCircle.frame.size.height = 50
//        buttonForCircle.layer.borderWidth = 1
//        buttonForCircle.layer.cornerRadius = buttonForCircle.frame.size.width/2
//        buttonForCircle.frame.origin.x = 100
//        buttonForCircle.frame.origin.y = 100
//       self.view.addSubview(buttonForCircle)
//
//        buttonForCircle.addTarget(self, action: #selector(moveCircle), for: .touchUpInside)
//
//        @IBAction func moveCircle() {
//        let viexX = self.view.frame.size.width
//        let viexY = self.view.frame.size.height
//        let newX = Int.random(in: 30..<Int(viexX)-100)
//        let newY = Int.random(in: 30..<Int(viexY)-100)
//
//        buttonForCircle.frame.origin.x = CGFloat(newX)
//        buttonForCircle.frame.origin.y = CGFloat(newY)
//
//        buttonForCircle.backgroundColor = random()
//
//    }
//
//     func random() -> UIColor {
//
//            func random() -> CGFloat { return .random(in:0...1) }
//
//            return UIColor(red:   random(),
//                           green: random(),
//                           blue:  random(),
//                           alpha: 1.0)
//        }
//
//}

// / / / / / / / / / / / / / / / / / / / / // / / /  SECOND GAME
//class ViewController: UIViewController {
//
//
//    let button = UIButton()
//    var arrayView = [UIView]()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        button.setTitle("TAP", for: .normal)
//        button.setTitleColor(.systemRed, for: .normal)
//        button.setTitleColor(.black, for: .highlighted)
//        button.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
//        button.frame.size.width = 300
//        button.frame.size.height = 50
//        button.layer.borderWidth = 1
//        button.frame.origin.x = 40
//        button.frame.origin.y = 818 - 50.0
//        self.view.addSubview(button)
//
//        button.addTarget(self, action: #selector(createView), for: .touchUpInside)
//
//    }
//    @IBAction func createView() {
//        let myView = UIView()
//        myView.backgroundColor = .green
//        myView.frame.size.width = 100
//        myView.frame.size.height = 100
//        if arrayView.count != 0 {
//            let prevView = arrayView[arrayView.count-1]
//            let newX = prevView.frame.origin.x + CGFloat(prevView.frame.size.width)
//            let newY = prevView.frame.origin.y + CGFloat(prevView.frame.size.height)
//            if newX < CGFloat(self.view.frame.size.width - 100) {
//                myView.frame.origin.x = newX
//                myView.frame.origin.y = prevView.frame.origin.y
//            } else {
//                if newY + CGFloat(prevView.frame.size.height) < button.frame.origin.y {
//                    myView.frame.origin.y = newY
//                    myView.frame.origin.x = 0
//                } else {
//                    return
//                }
//            }
//        } else {
//            myView.frame.origin.x = 0
//            myView.frame.origin.y = 44
//        }
//
//        arrayView.append(myView)
//        self.view.addSubview(myView)
//
//    }
//
//}
//

// / / / / / / / / / / / / / / / /  /  /  THIRD GAME
class ViewController: UIViewController {

    let buttonUp = UIButton()
    let buttonDown = UIButton()
    let buttonLeft = UIButton()
    let buttonRight = UIButton()
    let circle = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additLjvfiional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        circle.center = view.center
        circle.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
        circle.frame.size.width = 50
        circle.frame.size.height = 50
        circle.layer.borderWidth = 1
        circle.layer.cornerRadius = circle.frame.size.width/2
        circle.frame.origin.x = 175
//        circle.frame.origin.y = 100
        self.view.addSubview(circle)

        buttonUp.setTitle("/\\", for: .normal)
        buttonUp.setTitleColor(.lightGray, for: .highlighted)
        buttonUp.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
        buttonUp.frame.size.width = 50
        buttonUp.frame.size.height = 50
        buttonUp.frame.origin.y = 818 - 150
        buttonUp.frame.origin.x = 175
        buttonUp.tag = 1
        self.view.addSubview(buttonUp)
      
        buttonDown.setTitle("\\/", for: .normal)
        buttonDown.center = view.center
        buttonDown.setTitleColor(.lightGray, for: .highlighted)
        buttonDown.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
        buttonDown.frame.size.width = 50
        buttonDown.frame.size.height = 50
        buttonDown.frame.origin.y = 818 - 50
        buttonDown.frame.origin.x = 175
        buttonDown.tag = 2
        self.view.addSubview(buttonDown)

        buttonLeft.setTitle("<", for: .normal)
        buttonLeft.setTitleColor(.lightGray, for: .highlighted)
        buttonLeft.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
        buttonLeft.frame.size.width = 50
        buttonLeft.frame.size.height = 50
        buttonLeft.frame.origin.y = 818 - 100
        buttonLeft.frame.origin.x = 100
        buttonLeft.tag = 3
        self.view.addSubview(buttonLeft)

        buttonRight.setTitle(">", for: .normal)
        buttonRight.setTitleColor(.lightGray, for: .highlighted)
        buttonRight.center = view.center
        buttonRight.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
        buttonRight.frame.size.width = 50
        buttonRight.frame.size.height = 50
        buttonRight.frame.origin.y = 818 - 100
        buttonRight.frame.origin.x = 250
        buttonRight.tag = 4
        self.view.addSubview(buttonRight)

        buttonUp.addTarget(self, action: #selector(moveCircle), for: .touchUpInside)
        buttonDown.addTarget(self, action: #selector(moveCircle), for: .touchUpInside)
        buttonLeft.addTarget(self, action: #selector(moveCircle), for: .touchUpInside)
        buttonRight.addTarget(self, action: #selector(moveCircle), for: .touchUpInside)
    }
        
    @IBAction func moveCircle(sender: UIButton) {
        var newMoveX = 0
        var newMoveY = 0
        if sender.tag == 1 {
            newMoveY = -50
        } else if sender.tag == 2 {
            newMoveY = 50
        } else if sender.tag == 3 {
            newMoveX = -50
        } else if sender.tag == 4 {
            newMoveX = 50
        }
        
        let newPositionX = circle.frame.origin.x + CGFloat(newMoveX)
        let newPositionY = circle.frame.origin.y + CGFloat(newMoveY)
        
        if newPositionX < 0 || newPositionX > view.frame.size.width - 50 {
            return
        }
        if newPositionY < 44 || newPositionY > buttonUp.frame.origin.y - 50 {
            return
        }
        circle.frame.origin.x = newPositionX
        circle.frame.origin.y = newPositionY

    }

    
}
