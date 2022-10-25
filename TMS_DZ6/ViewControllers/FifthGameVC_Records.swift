//
//  FifthGameVC_Records.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 22.08.2022.
//

import UIKit

class FifthGameVC_Records: UIViewController  {
    
    private let closeButton = CloseButton()
    private let labelTitle: UILabel = {
       let title = UILabel()
        title.text = "Scores"
        title.font = .boldSystemFont(ofSize: 40)
        return title
    }()
    
    private let tableScores: UITableView = {
        let tableScores = UITableView.init(frame: .zero, style: UITableView.Style.plain)
  
        return tableScores
    }()
    
    var imageNameArray: [String] = []
    
    // MARK: common screen elements
    private let gameSettingsSaved: SettingsGame = {
        guard let gameSettingsSaved = UserDefaults.standard.value(SettingsGame.self, forKey: "userGameSettings") else {return SettingsGame()}
        return gameSettingsSaved
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateLayout(with: view.frame.size)
        view.backgroundColor = .white
        setupUI()

        tableScores.dataSource = self
        tableScores.register(UITableViewCell.self, forCellReuseIdentifier: "id")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       super.viewWillTransition(to: size, with: coordinator)
       coordinator.animate(alongsideTransition: { (contex) in
          self.updateLayout(with: size)
       }, completion: nil)
    }
    
    private func setupUI() {
        
        view.addSubview(closeButton)
        
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            closeButton.heightAnchor.constraint(equalToConstant: 20), // высота
            closeButton.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(labelTitle)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: closeButton.bottomAnchor),
            labelTitle.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            labelTitle.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
        ])
        
        view.addSubview(tableScores)
        tableScores.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableScores.topAnchor.constraint(equalTo: labelTitle.bottomAnchor),
            tableScores.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableScores.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableScores.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
        ])
        
        for (key, value) in gameSettingsSaved.scores {
            imageNameArray.append(String("\(key) - \(value)"))
        }
        
    }

    private func updateLayout(with size: CGSize) {
       self.tableScores.frame = CGRect.init(origin: .zero, size: size)
    }
    
    @objc func closeButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension FifthGameVC_Records: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return imageNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Метод dequeueReusableCell получит объект ячейки по идентификатору, а мы сделаем приведение типа при помощи as до класса TableViewCell, которым и должна быть ячейка. textLabel это проперти базового класса, никакой дополнительной настройки не требуется.
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
           cell.textLabel?.text = self.imageNameArray[indexPath.row]
//        cell.backgroundColor = .red
        return cell
    }
    
}
