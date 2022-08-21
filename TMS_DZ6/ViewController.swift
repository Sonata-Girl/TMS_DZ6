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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        
        let safeArea = self.view.safeAreaInsets
        
        label.text = "Welcome Screen! Choose the game..."
        label.textColor = .black
//        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame.size.width = self.view.frame.size.width
        label.numberOfLines = 0
        label.frame.size.height = 30
//        label.layer.borderWidth = 1
//        label.layer.cornerRadius = label.frame.size.width/20
        label.center = self.view.center
        label.textAlignment = .center
        self.view.addSubview(label)

        button3.setTitle("Game 3", for: .normal)
        button3.setTitle("Start", for: .selected)
        button3.setTitle("Start", for: .highlighted)
        button3.frame.size.width = self.view.frame.size.width/5
        button3.frame.size.height = 30
        button3.backgroundColor = .systemPurple
        button3.frame.origin.x = self.view.frame.size.width/2 - safeArea.left - (button3.frame.size.width/2)
        button3.frame.origin.y = self.view.frame.size.height - safeArea.bottom - button3.frame.size.height - 10
        self.view.addSubview(button3)
     
        button2.setTitle("Game 2", for: .normal)
        button2.setTitle("Start", for: .selected)
        button2.setTitle("Start", for: .highlighted)
        button2.frame.size.width = self.view.frame.size.width/5
        button2.frame.size.height = 30
        button2.backgroundColor = .systemPurple
        button2.frame.origin.x = self.view.frame.size.width/2 - safeArea.left - (button2.frame.size.width/2)
        button2.frame.origin.y = button3.frame.origin.y - button2.frame.size.height - 20
        self.view.addSubview(button2)
        
        button1.setTitle("Game 1", for: .normal)
        button1.setTitle("Start", for: .selected)
        button1.setTitle("Start", for: .highlighted)
        button1.frame.size.width = self.view.frame.size.width/5
        button1.frame.size.height = 30
        button1.backgroundColor = .systemPurple
        button1.frame.origin.x = self.view.frame.size.width/2 - safeArea.left - (button1.frame.size.width/2)
        button1.frame.origin.y = button2.frame.origin.y - button1.frame.size.height - 20
        self.view.addSubview(button1)
    
        button1.addTarget(self, action: #selector(pressButton1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(pressButton2), for: .touchUpInside)
        button3.addTarget(self, action: #selector(pressButton3), for: .touchUpInside)
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
