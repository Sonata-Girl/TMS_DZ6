//
//  SeventhGameVC.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 22.08.2022.
//

import UIKit

class SeventhGameVC: UIViewController {

    private let viewCircle = UIView()
    private let closeButton = CloseButton()
    private var originCircle = CGFloat(0)
    private var sizeCircle = CGFloat(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view..
        originCircle = self.view.frame.size.width/4
        sizeCircle = self.view.frame.size.width/8
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
        
        viewCircle.backgroundColor = .red
        viewCircle.frame.size.width = sizeCircle
        viewCircle.frame.size.height = sizeCircle
        viewCircle.center = view.center
        viewCircle.layer.cornerRadius = sizeCircle/2
        viewCircle.layer.borderWidth = 2
        
        self.view.addSubview(viewCircle)
        closeButton.frame.origin.x = self.view.frame.width - self.view.safeAreaInsets.right - closeButton.frame.size.width - 5 
        closeButton.frame.origin.y = self.view.safeAreaInsets.top + 1
        self.view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        
        let circleMove = UIPanGestureRecognizer(target: self, action: #selector(circleMove))
        self.view.addGestureRecognizer(circleMove)
    }
    
    
    @IBAction func closeButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func circleMove(_ sender: UIPanGestureRecognizer) {
//         let translation = sender.translation(in: self.view)
//          viewCircle.center = CGPoint(x: viewCircle.center.x + translation.x,
//                                    y: viewCircle.center.y + translation.y)
//          sender.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
        let touchPoint = sender.location(in: self.view)

        guard touchPoint.y >= self.view.safeAreaInsets.top + sizeCircle/2 else {
            viewCircle.frame.origin.y = self.view.safeAreaInsets.top
            return
        }
        guard touchPoint.y <= self.view.frame.height - self.view.safeAreaInsets.bottom - sizeCircle/2 else {
            viewCircle.frame.origin.y = self.view.frame.height - self.view.safeAreaInsets.bottom - sizeCircle
            return
        }
        guard touchPoint.x >= sizeCircle/2 else {
            viewCircle.frame.origin.x = 0
            return
        }
        guard touchPoint.x <= self.view.frame.width - sizeCircle/2 else {
            viewCircle.frame.origin.x = self.view.frame.width - sizeCircle
            return
        }

        //        viewCircle.frame.origin.x = touchPoint.x - sizeCircle/2
        //        viewCircle.frame.origin.y = touchPoint.y - sizeCircle/2

        viewCircle.center = CGPoint(x: touchPoint.x, y: touchPoint.y)
    }

}
