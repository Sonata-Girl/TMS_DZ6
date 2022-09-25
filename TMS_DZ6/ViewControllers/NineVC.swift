//
//  NineVC.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 03.09.2022.
//

import UIKit

enum Step {
    case left, right, up, down
}

class NineVC: UIViewController {
    
    private let closeButton = CloseButton()
    private var lastStep = Step.up
    private let button: UIButton = {
      let button = UIButton()
      button.setTitle("Start loop", for: .normal)
      button.titleLabel?.backgroundColor = .orange
      button.translatesAutoresizingMaskIntoConstraints = false
     
      return button
    }()
    
    private let ball: UIView = {
        let ballView = UIButton()
        ballView.backgroundColor = .orange
        ballView.translatesAutoresizingMaskIntoConstraints = false
       
        return ballView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(closeButton)
        view.addSubview(button)
        view.addSubview(ball)
        
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        button.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
   
    }
    
//    private func setupUI() {
//        self.view.addSubview(closeButton)
//        NSLayoutConstraint.activate([
//            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            closeButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
//            closeButton.heightAnchor.constraint(equalToConstant: 20), // высота
//            closeButton.widthAnchor.constraint(equalToConstant: 20)
//        ])
//        
//        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
//    }
//    
    override func viewDidLayoutSubviews() {
        setupUI()
        ball.frame.size.width = 50
        ball.frame.size.height = 50
        ball.layer.cornerRadius = ball.frame.size.width / 2
    }
    
    private func setupUI() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        //  как задавать констрейнты constraints
        // сверху справа слева = по 100 и height 20
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            closeButton.heightAnchor.constraint(equalToConstant: 20), // высота
            closeButton.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            ball.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            ball.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100)
        ])
        
    }
    
    @IBAction func startButtonAction() {
        self.loopingMove()
    }
    
    private func loopingMove() {
        
        UIView.animate(withDuration: 0.3) {
            self.animate()
        } completion: { _ in
            self.loopingMove()
        }

    }
    
    private func animate() {
        switch lastStep {
        case .left:
            self.ball.frame.origin.y -= 200
            self.lastStep = .up
        case .right:
            self.ball.frame.origin.y += 200
            self.lastStep = .down
        case .up:
            self.ball.frame.origin.x += 200
            self.lastStep = .right
        case .down:
            self.ball.frame.origin.x -= 200
            self.lastStep = .left
        }

    }
    
    @IBAction func closeButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}
