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
//    let buttonPlus = UIButton()
//    let buttonMinus = UIButton()
//    var tupleSizeReact = (x: 100, y: 100)
//
//    var arrayView = [UIView]()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        let safeArea = view.safeAreaInsets
//
//        button.setTitle("TAP", for: .normal)
//        button.setTitleColor(.systemRed, for: .normal)
//        button.setTitleColor(.black, for: .highlighted)
//        button.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
//        button.frame.size.width = 100
//        button.frame.size.height = 50
//        button.layer.borderWidth = 1
//        button.frame.origin.x = (view.frame.size.width / 2) - (button.frame.size.width / 2 )
//        button.frame.origin.y = view.frame.size.height - safeArea.bottom - button.frame.size.height
//        self.view.addSubview(button)
//        button.addTarget(self, action: #selector(createView), for: .touchUpInside)
//
//        buttonPlus.setTitle("+", for: .normal)
//        buttonPlus.setTitleColor(.systemRed, for: .normal)
//        buttonPlus.setTitleColor(.black, for: .highlighted)
//        buttonPlus.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
//        buttonPlus.frame.size.width = 50
//        buttonPlus.frame.size.height = 50
//        buttonPlus.layer.borderWidth = 1
//        buttonPlus.frame.origin.x = button.frame.origin.x - 10 - buttonPlus.frame.size.width
//        buttonPlus.frame.origin.y = view.frame.size.height - safeArea.bottom - buttonPlus.frame.size.height
//        self.view.addSubview(buttonPlus)
//        buttonPlus.addTarget(self, action: #selector(actionPlus), for: .touchDown)
//
//        buttonMinus.setTitle("-", for: .normal)
//        buttonMinus.setTitleColor(.systemRed, for: .normal)
//        buttonMinus.setTitleColor(.black, for: .highlighted)
//        buttonMinus.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
//        buttonMinus.frame.size.width = 50
//        buttonMinus.frame.size.height = 50
//        buttonMinus.layer.borderWidth = 1
//        buttonMinus.frame.origin.x = button.frame.origin.x + button.frame.size.width + 10
//        buttonMinus.frame.origin.y = view.frame.size.height - safeArea.bottom - buttonMinus.frame.size.height
//        self.view.addSubview(buttonMinus)
//        buttonMinus.addTarget(self, action: #selector(actionMinus), for: .touchDown)
//
//    }
//
//    @IBAction func actionPlus() {
//        tupleSizeReact.y += 10
//        tupleSizeReact.x += 10
//    }
//    @IBAction func actionMinus() {
//        tupleSizeReact.y -= 10
//        tupleSizeReact.x -= 10
//    }
//
//    @IBAction func createView() {
//        let myView = UIView()
//        myView.backgroundColor = random()
//        myView.frame.size.width = CGFloat(tupleSizeReact.x)
//        myView.frame.size.height = CGFloat(tupleSizeReact.y)
//        if arrayView.count != 0 {
//            let prevView = arrayView[arrayView.count-1]
//            let newX = prevView.frame.origin.x + CGFloat(prevView.frame.size.width)
//            let newY = prevView.frame.origin.y + CGFloat(prevView.frame.size.height)
//            if newX < CGFloat(self.view.frame.size.width - myView.frame.size.width) {
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
//    func random() -> UIColor {
//
//                    func random() -> CGFloat { return .random(in:0...1) }
//
//                    return UIColor(red:   random(),
//                                   green: random(),
//                                   blue:  random(),
//                                   alpha: 1.0)
//                }
//
//}


//// / / / / / / / / / / / / / / / /  /  /  THIRD GAME (перемещение шарика кнопками вниз вверх и тд)

enum Side {
    case left, right, up, down
}

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

        let safeArea = view.safeAreaInsets

        let sizeX10 = view.frame.size.width/10
        let sizeX3 = view.frame.size.width/3
        let sizeX2 = view.frame.size.width/2

        circle.center = view.center
        circle.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
        circle.frame.size.width = sizeX10
        circle.frame.size.height = sizeX10
        circle.layer.borderWidth = 1
        circle.layer.cornerRadius = circle.frame.size.width/2
        circle.frame.origin.x = sizeX2 - circle.frame.size.height
        self.view.addSubview(circle)

        buttonUp.setTitle("/\\", for: .normal)
        buttonUp.setTitleColor(.lightGray, for: .highlighted)
        buttonUp.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        buttonUp.frame.size.width = sizeX10
        buttonUp.frame.size.height = sizeX10
        buttonUp.frame.origin.y = view.frame.size.height - safeArea.bottom - (buttonUp.frame.size.height * 3)
        buttonUp.frame.origin.x = sizeX2 - (buttonUp.frame.size.width/2)
        self.view.addSubview(buttonUp)

        buttonDown.setTitle("\\/", for: .normal)
        buttonDown.center = view.center
        buttonDown.setTitleColor(.lightGray, for: .highlighted)
        buttonDown.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        buttonDown.frame.size.width = sizeX10
        buttonDown.frame.size.height = sizeX10
        buttonDown.frame.origin.y = view.frame.size.height - safeArea.bottom - buttonDown.frame.size.height
        buttonDown.frame.origin.x = sizeX2 - (buttonDown.frame.size.width/2)
        self.view.addSubview(buttonDown)

        buttonLeft.setTitle("<", for: .normal)
        buttonLeft.setTitleColor(.lightGray, for: .highlighted)
        buttonLeft.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        buttonLeft.frame.size.width = sizeX10
        buttonLeft.frame.size.height = sizeX10
        buttonLeft.frame.origin.y = view.frame.size.height - safeArea.bottom - (buttonLeft.frame.size.height * 2)
        buttonLeft.frame.origin.x = sizeX3
        self.view.addSubview(buttonLeft)

        buttonRight.setTitle(">", for: .normal)
        buttonRight.setTitleColor(.lightGray, for: .highlighted)
        buttonRight.center = view.center
        buttonRight.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        buttonRight.frame.size.width = sizeX10
        buttonRight.frame.size.height = sizeX10
        buttonRight.frame.origin.y = view.frame.size.height - safeArea.bottom - (buttonRight.frame.size.height * 2)
        buttonRight.frame.origin.x = view.frame.size.width - (sizeX3 + buttonRight.frame.size.width)
        self.view.addSubview(buttonRight)

        buttonUp.addTarget(self, action: #selector(moveUp), for: .touchUpInside)
        buttonDown.addTarget(self, action: #selector(moveDown), for: .touchUpInside)
        buttonLeft.addTarget(self, action: #selector(moveLeft), for: .touchUpInside)
        buttonRight.addTarget(self, action: #selector(moveRight), for: .touchUpInside)
    }

    @IBAction func moveUp() {
        moveCircle(direction: .up)
    }

    @IBAction func moveDown() {
        moveCircle(direction: .down)
    }

   @IBAction func moveLeft() {
       moveCircle(direction: .left)
   }

    @IBAction func moveRight() {
        moveCircle(direction: .right)
    }

    private func moveCircle(direction: Side) {
        var newMoveX = 0
        var newMoveY = 0
        switch direction {
        case .left:
            newMoveX = -50
        case .right:
            newMoveX = 50
        case .up:
            newMoveY = -50
        case .down:
            newMoveY = 50
        }

        let safeArea = view.safeAreaInsets

        let newPositionX = circle.frame.origin.x + CGFloat(newMoveX)
        let newPositionY = circle.frame.origin.y + CGFloat(newMoveY)

        if newPositionX < 10 || newPositionX > view.frame.size.width - circle.frame.size.width {
            return
        }
        if newPositionY < safeArea.top || newPositionY > buttonUp.frame.origin.y - circle.frame.size.height {
            return
        }
        circle.frame.origin.x = newPositionX
        circle.frame.origin.y = newPositionY

    }


}

// // решение от препода
//class ViewController: UIViewController {
//
//    let buttonRight = UIButton()
//    let textSide = UITextField()
//
//    var side: CGFloat = 100
//    var x: CGFloat = 0
//    var y: CGFloat = 0
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additLjvfiional setup after loading the view.
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        let safeArea = view.safeAreaInsets
//
//        let sizeX10 = view.frame.size.width/10
//        let sizeX3 = view.frame.size.width/3
////        let sizeX2 = view.frame.size.width/2
//
//
//        buttonRight.setTitle("Create", for: .normal)
//        buttonRight.setTitleColor(.lightGray, for: .highlighted)
//        buttonRight.center = view.center
//        buttonRight.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
//        buttonRight.frame.size.width = sizeX10
//        buttonRight.frame.size.height = sizeX10
//        buttonRight.frame.origin.y = view.frame.size.height - safeArea.bottom - (buttonRight.frame.size.height * 2)
//        buttonRight.frame.origin.x = view.frame.size.width - sizeX3
//        buttonRight.tag = 4
//        self.view.addSubview(buttonRight)
//
//        buttonRight.addTarget(self, action: #selector(pressed), for: .touchUpInside)
//
//        textSide.backgroundColor = .cyan
//        textSide.backgroundColor = .cyan
//        textSide.frame.size.width = sizeX10 * 3
//        textSide.frame.size.height = sizeX10
//        textSide.frame.origin.y = view.frame.size.height - safeArea.bottom - (buttonRight.frame.size.height * 2)
//        textSide.frame.origin.x = sizeX3
//        self.view.addSubview(textSide)
//
//     }
//
//
//    @IBAction func pressed(sender: UIButton) {
//        self.y = 0
//        self.x = 0
//        self.createView()
//    }
//
//    func addview() {
//        let newView = UIView(frame: CGRect(x: self.x, y: self.y, width: self.side, height: self.side))
//        newView.backgroundColor = self.random()
//        self.view.addSubview(newView)
//
//        let label = UILabel (frame: CGRect(x: self.x, y: self.y, width: self.side, height: self.side))
//        label.text = newView.backgroundColor?.accessibilityName
//        self.view.addSubview(label)
//    }
//
//    func createView() {
//        self.side = CGFloat(Double(textSide.text!) ?? 0)
//        guard self.side != 0 else {return }
//        if canCreateView() {
//            addview()
//            self.x += self.side
//            self.createView()
//        } else if self.x + self.side > self.view.frame.size.width {
//            self.x = 0
//            self.y += self.side
//            if canCreateView(){
//                self.createView()
//            }
//        }
//    }
//
//    func canCreateView() -> Bool {
//        if self.x + self.side > self.view.frame.size.width {return false}
//        if self.y + self.side > self.view.frame.size.height {return false}
//
//        return true
//    }
//
//    func random() -> UIColor {
//
//                func random() -> CGFloat { return .random(in:0...1) }
//
//                return UIColor(red:   random(),
//                               green: random(),
//                               blue:  random(),
//                               alpha: 1.0)
//            }
//
//}
