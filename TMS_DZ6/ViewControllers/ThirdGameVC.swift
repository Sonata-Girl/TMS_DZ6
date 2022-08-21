//
//  ThirdGameVC.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 21.08.2022.
//

import UIKit

enum Side {
    case left, right, up, down
}

class ThirdGameVC: UIViewController {
    
    //// / / / / / / / / / / / / / / / /  /  /  THIRD GAME (перемещение шарика кнопками вниз вверх и тд)
    
    let buttonUp = UIButton()
    let buttonDown = UIButton()
    let buttonLeft = UIButton()
    let buttonRight = UIButton()
    let circle = UIView()
    let closeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additLjvfiional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
        view.backgroundColor = .white
       
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
        
        closeButton.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        closeButton.setTitle("x", for: .normal)
        closeButton.titleLabel?.textColor = .white
        closeButton.frame.size.width = 20
        closeButton.frame.size.height = 20
        closeButton.layer.borderWidth = 1
        closeButton.layer.cornerRadius = closeButton.frame.size.height/2
        closeButton.frame.origin.x = self.view.frame.width - self.view.safeAreaInsets.right - closeButton.frame.size.width
        closeButton.frame.origin.y = self.view.safeAreaInsets.top + 1
        self.view.addSubview(closeButton)
        
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        
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
    
    @IBAction func closeButtonAction() {
        dismiss(animated: true, completion: nil)
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
