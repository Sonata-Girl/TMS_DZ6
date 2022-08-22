//
//  GameButton.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 22.08.2022.
//

import UIKit

class GameButton: UIButton {
    
    let buttonWidth = CGFloat(250)
    let buttonHeight = CGFloat(30)
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        setTitle("Start", for: .selected)
        setTitle("Start", for: .highlighted)
        backgroundColor = .systemPurple
        frame.size.width = buttonWidth
        frame.size.height = buttonHeight        
    }
}


