//
//  FirstGameVC.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 21.08.2022.
//

import UIKit

class FirstGameVC: UIViewController {
    
    //  / / / / / / / / / / / / / / / / / / // / / /   FIRST GAME
    let buttonForCircle = UIButton()
    let closeButton = CloseButton()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.backgroundColor = .white
        
        buttonForCircle.backgroundColor = #colorLiteral(red: 0.2426634431, green: 0.9153795242, blue: 0.618198216, alpha: 0.5)
        buttonForCircle.frame.size.width = 50
        buttonForCircle.frame.size.height = 50
        buttonForCircle.layer.borderWidth = 1
        buttonForCircle.layer.cornerRadius = buttonForCircle.frame.size.width/2
        buttonForCircle.frame.origin.x = 100
        buttonForCircle.frame.origin.y = 100
        self.view.addSubview(buttonForCircle)
        
        buttonForCircle.addTarget(self, action: #selector(moveCircle), for: .touchUpInside)
        
//        closeButton.frame.origin.x = self.view.frame.width - self.view.safeAreaInsets.right - closeButton.frame.size.width - 5
//        closeButton.frame.origin.y = self.view.safeAreaInsets.top + 1
//
        
        setupUI()
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
    
    @IBAction func moveCircle() {
        let viexX = self.view.frame.size.width
        let viexY = self.view.frame.size.height
        let newX = Int.random(in: 30..<Int(viexX)-100)
        let newY = Int.random(in: 30..<Int(viexY)-100)
        
        buttonForCircle.frame.origin.x = CGFloat(newX)
        buttonForCircle.frame.origin.y = CGFloat(newY)
        
        buttonForCircle.backgroundColor = random()
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
