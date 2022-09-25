//
//  FifthGameVC_Start.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 22.08.2022.
//

import UIKit

class FifthGameVC_Start: UIViewController {

    let closeButton = CloseButton()
    let startGameButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(closeButton)
        view.addSubview(startGameButton)
        
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        startGameButton.addTarget(self, action: #selector(startGameButtonAction), for: .touchUpInside)
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
        
        closeButton.frame.origin.x = self.view.frame.width - self.view.safeAreaInsets.right - closeButton.frame.size.width - 5
        closeButton.frame.origin.y = self.view.safeAreaInsets.top + 1
        
        startGameButton.setTitle("Start game", for: .normal)
        startGameButton.backgroundColor = .orange
        startGameButton.center = view.center
//        startGameButton.frame.size.width = 100
//        startGameButton.frame.size.height = 30
                        
        startGameButton.translatesAutoresizingMaskIntoConstraints = false
        //  как задавать констрейнты constraints
        // сверху справа слева = по 100 и height 20
        NSLayoutConstraint.activate([
            startGameButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            startGameButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            startGameButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
        ])
    }
    
    @IBAction func closeButtonAction() {
//        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func startGameButtonAction() {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "FifthGameVC_Main") as? FifthGameVC_Main else {return}

//        let controller = FifthGameVC_Main()
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
