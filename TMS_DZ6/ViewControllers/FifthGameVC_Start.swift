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
    let settingsButton = UIButton()
    let scoresButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupUI()
    }
    
    private func setupUI() {
        startGameButton.setTitle("Start game", for: .normal)
        startGameButton.backgroundColor = .orange
        
        settingsButton.setTitle("Settings", for: .normal)
        settingsButton.backgroundColor = .orange
       
        scoresButton.setTitle("Scores", for: .normal)
        scoresButton.backgroundColor = .orange
      
        view.addSubview(closeButton)
        view.addSubview(settingsButton)
        view.addSubview(startGameButton)
        view.addSubview(scoresButton)
        
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        startGameButton.addTarget(self, action: #selector(startGameButtonAction), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(settingsButtonAction), for: .touchUpInside)
        scoresButton.addTarget(self, action: #selector(scoresButtonAction), for: .touchUpInside)
       
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            closeButton.heightAnchor.constraint(equalToConstant: 20), // высота
            closeButton.widthAnchor.constraint(equalToConstant: 20)
        ])
                
        startGameButton.translatesAutoresizingMaskIntoConstraints = false
        //  как задавать констрейнты constraints
        // сверху справа слева = по 100 и height 20
        NSLayoutConstraint.activate([
            startGameButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            startGameButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            startGameButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            startGameButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 20),
            settingsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            settingsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            settingsButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        scoresButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoresButton.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: 20),
            scoresButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            scoresButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            scoresButton.heightAnchor.constraint(equalToConstant: 30)
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
    
    @IBAction func settingsButtonAction() {
        let settingsVC = FifthGameSettingsVC()
        self.navigationController?.pushViewController(settingsVC, animated: true)        
    }
    
    @IBAction func scoresButtonAction() {
        let scoresVC = FifthGameVC_Records()
        self.navigationController?.pushViewController(scoresVC, animated: true)
    }
}
