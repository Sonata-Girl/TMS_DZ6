//
//  FourthGameVC.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 22.08.2022.
//

import UIKit

class FourthGameVC: UIViewController {
    
    let buttonRight = UIButton()
    let textSide = UITextField()
    let closeButton = CloseButton()
    
    var side: CGFloat = 100
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additLjvfiional setup after loading the view.
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = .white
       
        let safeArea = view.safeAreaInsets
        
        let sizeX10 = view.frame.size.width/10
        let sizeX3 = view.frame.size.width/3
        //        let sizeX2 = view.frame.size.width/2
        
        
        buttonRight.setTitle("Create", for: .normal)
        buttonRight.setTitleColor(.lightGray, for: .highlighted)
        buttonRight.center = view.center
        buttonRight.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
        buttonRight.frame.size.width = sizeX10
        buttonRight.frame.size.height = sizeX10
        buttonRight.frame.origin.y = view.frame.size.height - safeArea.bottom - (buttonRight.frame.size.height * 2)
        buttonRight.frame.origin.x = view.frame.size.width - sizeX3
        buttonRight.tag = 4
        self.view.addSubview(buttonRight)
        
        buttonRight.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        textSide.backgroundColor = .cyan
        textSide.backgroundColor = .cyan
        textSide.frame.size.width = sizeX10 * 3
        textSide.frame.size.height = sizeX10
        textSide.frame.origin.y = view.frame.size.height - safeArea.bottom - (buttonRight.frame.size.height * 2)
        textSide.frame.origin.x = sizeX3
        self.view.addSubview(textSide)
        
        closeButton.frame.origin.x = self.view.frame.width - self.view.safeAreaInsets.right - closeButton.frame.size.width - 5
        closeButton.frame.origin.y = self.view.safeAreaInsets.top + 1
        self.view.addSubview(closeButton)
        
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
    
    }
    
    
    @IBAction func pressed(sender: UIButton) {
        self.y = 0
        self.x = 0
        self.createView()
    }
    
    @IBAction func closeButtonAction() {
//        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    func addview() {
        let newView = UIView(frame: CGRect(x: self.x, y: self.y, width: self.side, height: self.side))
        newView.backgroundColor = self.random()
        self.view.addSubview(newView)
        
        let label = UILabel (frame: CGRect(x: self.x, y: self.y, width: self.side, height: self.side))
        label.text = newView.backgroundColor?.accessibilityName
        self.view.addSubview(label)
    }
    
    func createView() {
        self.side = CGFloat(Double(textSide.text!) ?? 0)
        guard self.side != 0 else {return }
        if canCreateView() {
            addview()
            self.x += self.side
            self.createView()
        } else if self.x + self.side > self.view.frame.size.width {
            self.x = 0
            self.y += self.side
            if canCreateView(){
                self.createView()
            }
        }
        
    }
    
    func canCreateView() -> Bool {
        if self.x + self.side > self.view.frame.size.width {return false}
        if self.y + self.side > self.view.frame.size.height {return false}
        
        return true
    }
    
    func random() -> UIColor {
        
        func random() -> CGFloat { return .random(in:0...1) }
        
        return UIColor(red:   random(),
                       green: random(),
                       blue:  random(),
                       alpha: 1.0)
    }
    
}
