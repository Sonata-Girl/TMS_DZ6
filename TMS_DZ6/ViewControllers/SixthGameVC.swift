//
//  SixthGameVC.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 22.08.2022.
//

import UIKit

class SixthGameVC: UIViewController {

    let closeButton = CloseButton()
    
    var originCircle = CGFloat(0)
    var sizeCircle = CGFloat(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view..
        originCircle = self.view.frame.size.width/4
        sizeCircle = self.view.frame.size.width/8
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.backgroundColor = .white
        
        closeButton.frame.origin.x = self.view.frame.width - self.view.safeAreaInsets.right - closeButton.frame.size.width
        closeButton.frame.origin.y = self.view.safeAreaInsets.top + 1
        self.view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        
        let newCoordCircleForTap = UITapGestureRecognizer(target: self, action: #selector(tapForCircle))
        newCoordCircleForTap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(newCoordCircleForTap)
    }
    
    @IBAction func closeButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapForCircle(_ sender: UITapGestureRecognizer) {
        let touchPoint = sender.location(in: self.view)
        
        let viewCircle = UIView()
        viewCircle.backgroundColor = random()
        viewCircle.frame.size.width = sizeCircle
        viewCircle.frame.size.height = sizeCircle
//        viewCircle.frame.origin.x = touchPoint.x - sizeCircle/2
//        viewCircle.frame.origin.y = touchPoint.y - sizeCircle/2
        viewCircle.center = CGPoint(x: touchPoint.x, y: touchPoint.y)
        viewCircle.layer.cornerRadius = sizeCircle/2
        viewCircle.layer.borderWidth = 2
        
        checkViewIsInterSecting(viewToCheck: viewCircle)
        self.view.addSubview(viewCircle)
    }
    
    func checkViewIsInterSecting(viewToCheck: UIView) {
        guard let allSubViews = self.view?.subviews else {return}
        for viewS in allSubViews { //Running the loop through the subviews array
                if viewToCheck.frame.intersects(viewS.frame) { //Checking the view is intersecting with other or not
                    viewS.removeFromSuperview()
                }
            }
    }
    
    func random() -> UIColor {
        
        func random() -> CGFloat { return .random(in:0...1) }
        
        return UIColor(red:   random(),
                       green: random(),
                       blue:  random(),
                       alpha: 1.0)
    }
}
