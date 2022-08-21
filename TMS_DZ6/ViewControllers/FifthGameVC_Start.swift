//
//  FifthGameVC_Start.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 22.08.2022.
//

import UIKit

class FifthGameVC_Start: UIViewController {

    let closeButton = UIButton()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = .white

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
    
    @IBAction func closeButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    

}
