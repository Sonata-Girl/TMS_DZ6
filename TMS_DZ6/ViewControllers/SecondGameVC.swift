//
//  SecondGameVC.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 21.08.2022.
//

import UIKit

class SecondGameVC: UIViewController {
    
    // / / / / / / / / / / / / / / / / / / / / // / / /  SECOND GAME
    
    let button = UIButton()
    let buttonPlus = UIButton()
    let buttonMinus = UIButton()
    var tupleSizeReact = (x: 100, y: 100)
    let closeButton = UIButton()
   
    var arrayView = [UIView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.backgroundColor = .white
       
        let safeArea = view.safeAreaInsets
        
        button.setTitle("TAP", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        button.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
        button.frame.size.width = 100
        button.frame.size.height = 50
        button.layer.borderWidth = 1
        button.frame.origin.x = (view.frame.size.width / 2) - (button.frame.size.width / 2 )
        button.frame.origin.y = view.frame.size.height - safeArea.bottom - button.frame.size.height
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(createView), for: .touchUpInside)
        
        buttonPlus.setTitle("+", for: .normal)
        buttonPlus.setTitleColor(.systemRed, for: .normal)
        buttonPlus.setTitleColor(.black, for: .highlighted)
        buttonPlus.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
        buttonPlus.frame.size.width = 50
        buttonPlus.frame.size.height = 50
        buttonPlus.layer.borderWidth = 1
        buttonPlus.frame.origin.x = button.frame.origin.x - 10 - buttonPlus.frame.size.width
        buttonPlus.frame.origin.y = view.frame.size.height - safeArea.bottom - buttonPlus.frame.size.height
        self.view.addSubview(buttonPlus)
        buttonPlus.addTarget(self, action: #selector(actionPlus), for: .touchDown)
        
        buttonMinus.setTitle("-", for: .normal)
        buttonMinus.setTitleColor(.systemRed, for: .normal)
        buttonMinus.setTitleColor(.black, for: .highlighted)
        buttonMinus.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
        buttonMinus.frame.size.width = 50
        buttonMinus.frame.size.height = 50
        buttonMinus.layer.borderWidth = 1
        buttonMinus.frame.origin.x = button.frame.origin.x + button.frame.size.width + 10
        buttonMinus.frame.origin.y = view.frame.size.height - safeArea.bottom - buttonMinus.frame.size.height
        self.view.addSubview(buttonMinus)
        buttonMinus.addTarget(self, action: #selector(actionMinus), for: .touchDown)
        
        closeButton.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        closeButton.setTitle("X", for: .normal)
        closeButton.titleLabel?.textColor = .white
        closeButton.frame.size.width = 20
        closeButton.frame.size.height = 20
        closeButton.layer.borderWidth = 1
        closeButton.layer.cornerRadius = closeButton.frame.size.height/2
        closeButton.frame.origin.x = self.view.frame.width - self.view.safeAreaInsets.right -  closeButton.frame.size.width - 5
        closeButton.frame.origin.y = self.view.safeAreaInsets.top + 1
        self.view.addSubview(closeButton)
        
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
 
    }
    
    private func setupUI() {
        self.view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            closeButton.heightAnchor.constraint(equalToConstant: 20), // высота
            closeButton.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
    }
    
    @IBAction func actionPlus() {
        tupleSizeReact.y += 10
        tupleSizeReact.x += 10
    }
    @IBAction func actionMinus() {
        tupleSizeReact.y -= 10
        tupleSizeReact.x -= 10
    }
    
    @IBAction func createView() {
        let myView = UIView()
        myView.backgroundColor = random()
        myView.frame.size.width = CGFloat(tupleSizeReact.x)
        myView.frame.size.height = CGFloat(tupleSizeReact.y)
        if arrayView.count != 0 {
            let prevView = arrayView[arrayView.count-1]
            let newX = prevView.frame.origin.x + CGFloat(prevView.frame.size.width)
            let newY = prevView.frame.origin.y + CGFloat(prevView.frame.size.height)
            if newX < CGFloat(self.view.frame.size.width - myView.frame.size.width) {
                myView.frame.origin.x = newX
                myView.frame.origin.y = prevView.frame.origin.y
            } else {
                if newY + CGFloat(prevView.frame.size.height) < button.frame.origin.y {
                    myView.frame.origin.y = newY
                    myView.frame.origin.x = 0
                } else {
                    return
                }
            }
        } else {
            myView.frame.origin.x = 0
            myView.frame.origin.y = 44
        }
        
        arrayView.append(myView)
        self.view.addSubview(myView)
        
    }
    
    @IBAction func closeButtonAction() {
//        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    func random() -> UIColor {
        
        func random() -> CGFloat { return .random(in:0...1) }
        
        return UIColor(red:   random(),
                       green: random(),
                       blue:  random(),
                       alpha: 1.0)
    }
    
}

