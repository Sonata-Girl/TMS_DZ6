//
//  ArrowButton.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 21.10.2022.
//

import UIKit

class ArrowButton: UIButton {
    
    var text: String = ""
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }
    
    func setupButton() {
         titleLabel?.textColor = .black
        setTitle(text, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        backgroundColor = .orange

        frame.size.width = 30
        frame.size.height = 30
        layer.borderWidth = 1
        layer.borderColor = .init(red: 50, green: 50, blue: 50, alpha: 50)
        layer.cornerRadius = frame.size.height/2
       
    }
}
