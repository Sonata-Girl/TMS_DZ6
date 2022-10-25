//
//  FifthGameSettingsVC.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 22.08.2022.
//

import UIKit

class FifthGameSettingsVC: UIViewController {
   
    // MARK: common screen elements
    private let gameSettingsSaved: SettingsGame = {
        guard let gameSettingsSaved = UserDefaults.standard.value(SettingsGame.self, forKey: "userGameSettings") else {return SettingsGame()}
        return gameSettingsSaved
    }()
    
    private let closeButton = CloseButton()
    private let settingsTopLabel: UILabel = {
        let settingsTopLabel = UILabel()
        settingsTopLabel.text = "Settings"
        settingsTopLabel.font = .boldSystemFont(ofSize: 40)
        settingsTopLabel.textColor = .orange
        settingsTopLabel.textAlignment = .center
        return settingsTopLabel
    }()
    
    private let scrollView = UIScrollView()
    private let stackViewVertical = UIStackView()
  
    private let gorizontStackViews: [UIStackView] = {
        var gorizontStackViews = [UIStackView]()
        
        let gorizontStackView1 = UIStackView()
        gorizontStackView1.axis = .horizontal
//        gorizontStackView1.backgroundColor = .yellow
        
        let gorizontStackView2 = UIStackView()
        gorizontStackView2.axis = .horizontal
//        gorizontStackView2.backgroundColor = .systemPink
        
        let gorizontStackView3 = UIStackView()
        gorizontStackView3.axis = .horizontal
//        gorizontStackView3.backgroundColor = .systemYellow
        
        let gorizontStackView4 = UIStackView()
        gorizontStackView4.axis = .horizontal
//        gorizontStackView4.backgroundColor = .green
        
        gorizontStackViews.append(gorizontStackView1)
        gorizontStackViews.append(gorizontStackView2)
        gorizontStackViews.append(gorizontStackView3)
        gorizontStackViews.append(gorizontStackView4)
  
        return gorizontStackViews
    }()
    
    // MARK: Labels of settings
    private let labels: [UILabel] = {
        var labels = [UILabel]()
        let label1 = UILabel()
        label1.text = "Gamer name"
        label1.font = .boldSystemFont(ofSize: 30)
        label1.textColor = .black
        label1.textAlignment = .right
        
        let label2 = UILabel()
        label2.text = "Submarine type"
        label2.font = .boldSystemFont(ofSize: 30)
        label2.textColor = .black
        label2.textAlignment = .right
        
        let label3 = UILabel()
        label3.text = "Enemy type"
        label3.font = .boldSystemFont(ofSize: 30)
        label3.textColor = .black
        label3.textAlignment = .right
        
        let label4 = UILabel()
        label4.text = "Game speed"
        label4.font = .boldSystemFont(ofSize: 30)
        label4.textColor = .black
        label4.textAlignment = .right
        
        labels.append(label1)
        labels.append(label2)
        labels.append(label3)
        labels.append(label4)
  
        return labels
    }()
    
    // MARK: Elements of values
    private let gamerName: UITextField = {
        let nameTextField = UITextField()
        nameTextField.text = "Enter your nickname"
        nameTextField.font = .boldSystemFont(ofSize: 30)
        nameTextField.textColor = .orange
        nameTextField.textAlignment = .left
        return nameTextField
    }()
    
    private var submarines = [UIImage]()
    private var animals = [UIImage]()

    private let prevArrowSubmarine = ArrowButton(text: "<")
    private let nextArrowSubmarine = ArrowButton(text: ">")
    
    private let submarineSetting: UIImageView = {
        var submarine = UIImageView()
        submarine.image = UIImage(named: "submarine-1")
  
        return submarine
    }()
    
    private let prevArrowEnemyType = ArrowButton(text: "<")
    private let nextArrowEnemyType = ArrowButton(text: ">")
    
    private let enemySetting: UIImageView = {
        var enemy = UIImageView()
        enemy.image = UIImage(named: "sharks")
  
        return enemy
    }()
    
    private let gameSpeedPicker: UIPickerView = {
        var pickerView = UIPickerView()
        
        // Customization
//        pickerView.backgroundColor = .brown
        return pickerView
    }()
    
    private var gameSpeedSetting = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        gameSpeedPicker.dataSource = self
        gameSpeedPicker.delegate = self
        
        submarines = gameSettingsSaved.submarines
        animals = gameSettingsSaved.animals
        
        setupUI()
        loadUserSettings()
    }
    
    private func loadUserSettings() {
        guard let userGameSettings = UserDefaults.standard.value(SettingsGame.self, forKey: "userGameSettings") else {return}
        gamerName.text = userGameSettings.gamerName
        submarineSetting.image = submarines[userGameSettings.submarineIndex]
        enemySetting.image = animals[userGameSettings.enemyIndex]
        gameSpeedSetting = userGameSettings.gameSpeed
       
        gameSpeedPicker.selectRow(gameSpeedSetting == 0 ? gameSpeedSetting : gameSpeedSetting - 1, inComponent: 0, animated: true)
       
    }
    
    private func setupUI() {
                
        view.addSubview(closeButton)
        
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        prevArrowSubmarine.addTarget(self, action: #selector(prevArrowSubmarineAction), for: .touchUpInside)
        nextArrowSubmarine.addTarget(self, action: #selector(nextArrowSubmarineAction), for: .touchUpInside)
        
        prevArrowEnemyType.addTarget(self, action: #selector(prevArrowEnemyTypeAction), for: .touchUpInside)
        nextArrowEnemyType.addTarget(self, action: #selector(nextArrowEnemyTypeAction), for: .touchUpInside)
       
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            closeButton.heightAnchor.constraint(equalToConstant: 20), // высота
            closeButton.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(settingsTopLabel)
        settingsTopLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingsTopLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsTopLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            settingsTopLabel.rightAnchor.constraint(equalTo: closeButton.leftAnchor, constant: 10),
        ])
        
        stackViewVertical.backgroundColor = .clear

        view.addSubview(stackViewVertical)
        stackViewVertical.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackViewVertical.topAnchor.constraint(equalTo: settingsTopLabel.bottomAnchor),
            stackViewVertical.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            stackViewVertical.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor), // высота
            stackViewVertical.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
        
        var topAnchor = stackViewVertical.topAnchor
        for stackView in gorizontStackViews {
            stackViewVertical.addSubview(stackView)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.rightAnchor.constraint(equalTo: stackViewVertical.rightAnchor),
                stackView.leftAnchor.constraint(equalTo: stackViewVertical.leftAnchor),
                stackView.heightAnchor.constraint(equalToConstant: CGFloat(80)), // высота
                stackView.widthAnchor.constraint(equalTo: stackViewVertical.widthAnchor)
            ])
            
            topAnchor = stackView.bottomAnchor
        }
                
        for (index, label) in labels.enumerated() {
            let gorizontStackView =  gorizontStackViews[index]
            gorizontStackView.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.leftAnchor.constraint(equalTo: gorizontStackViews[index].leftAnchor),
                label.heightAnchor.constraint(equalToConstant: 100) // высота
            ])
        }
        
        gorizontStackViews[0].addSubview(gamerName)
        gamerName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gamerName.topAnchor.constraint(equalTo: gorizontStackViews[0].topAnchor),
            gamerName.bottomAnchor.constraint(equalTo: gorizontStackViews[0].bottomAnchor),
            gamerName.rightAnchor.constraint(equalTo: gorizontStackViews[0].rightAnchor),
            gamerName.heightAnchor.constraint(equalToConstant: 100) // высота
        ])
        
        gorizontStackViews[1].addSubview(nextArrowSubmarine)
        gorizontStackViews[1].addSubview(submarineSetting)
        gorizontStackViews[1].addSubview(prevArrowSubmarine)
        nextArrowSubmarine.translatesAutoresizingMaskIntoConstraints = false
        submarineSetting.translatesAutoresizingMaskIntoConstraints = false
        prevArrowSubmarine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextArrowSubmarine.centerYAnchor.constraint(equalTo: gorizontStackViews[1].centerYAnchor),
            nextArrowSubmarine.rightAnchor.constraint(equalTo: gorizontStackViews[1].rightAnchor),
            nextArrowSubmarine.heightAnchor.constraint(equalToConstant: 30), // высота
            nextArrowSubmarine.widthAnchor.constraint(equalToConstant: 30),
            submarineSetting.topAnchor.constraint(equalTo: gorizontStackViews[1].topAnchor),
            submarineSetting.bottomAnchor.constraint(equalTo: gorizontStackViews[1].bottomAnchor),
            submarineSetting.rightAnchor.constraint(equalTo: nextArrowSubmarine.leftAnchor, constant: -30),
            submarineSetting.heightAnchor.constraint(equalToConstant: 40), // высота
            submarineSetting.widthAnchor.constraint(equalToConstant: 70),
            prevArrowSubmarine.centerYAnchor.constraint(equalTo: gorizontStackViews[1].centerYAnchor),
            prevArrowSubmarine.rightAnchor.constraint(equalTo: submarineSetting.leftAnchor, constant: -30),
            prevArrowSubmarine.heightAnchor.constraint(equalToConstant: 30), // высота
            prevArrowSubmarine.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        gorizontStackViews[2].addSubview(nextArrowEnemyType)
        gorizontStackViews[2].addSubview(enemySetting)
        gorizontStackViews[2].addSubview(prevArrowEnemyType)
        nextArrowEnemyType.translatesAutoresizingMaskIntoConstraints = false
        enemySetting.translatesAutoresizingMaskIntoConstraints = false
        prevArrowEnemyType.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextArrowEnemyType.centerYAnchor.constraint(equalTo: gorizontStackViews[2].centerYAnchor),
            nextArrowEnemyType.rightAnchor.constraint(equalTo: gorizontStackViews[2].rightAnchor),
            nextArrowEnemyType.heightAnchor.constraint(equalToConstant: 30), // высота
            nextArrowEnemyType.widthAnchor.constraint(equalToConstant: 30),
            enemySetting.topAnchor.constraint(equalTo: gorizontStackViews[2].topAnchor),
            enemySetting.bottomAnchor.constraint(equalTo: gorizontStackViews[2].bottomAnchor),
            enemySetting.rightAnchor.constraint(equalTo: nextArrowEnemyType.leftAnchor, constant: -30),
            enemySetting.heightAnchor.constraint(equalToConstant: 40), // высота
            enemySetting.widthAnchor.constraint(equalToConstant: 70),
            prevArrowEnemyType.centerYAnchor.constraint(equalTo: gorizontStackViews[2].centerYAnchor),
            prevArrowEnemyType.rightAnchor.constraint(equalTo: enemySetting.leftAnchor, constant: -30),
            prevArrowEnemyType.heightAnchor.constraint(equalToConstant: 30), // высота
            prevArrowEnemyType.widthAnchor.constraint(equalToConstant: 30)
        ])
               
        gorizontStackViews[3].addSubview(gameSpeedPicker)
        gameSpeedPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameSpeedPicker.centerYAnchor.constraint(equalTo: gorizontStackViews[3].centerYAnchor),
            gameSpeedPicker.rightAnchor.constraint(equalTo: gorizontStackViews[3].rightAnchor),
            gameSpeedPicker.heightAnchor.constraint(equalToConstant: 50), // высота
            gameSpeedPicker.widthAnchor.constraint(equalToConstant: 200)
        ])
       
    }
    
    @objc func closeButtonAction() {
        
        let userGameSettings = SettingsGame(gamerName: gamerName.text ?? "",
                                        submarineIndex: submarines.firstIndex(of: submarineSetting.image ?? UIImage()) ?? 0,
                                        enemyIndex: animals.firstIndex(of: enemySetting.image ?? UIImage()) ?? 0,
                                        gameSpeed: gameSpeedSetting,
                                            scores: gameSettingsSaved.scores)
        
        UserDefaults.standard.set(encodable: userGameSettings, forKey: "userGameSettings")

        navigationController?.popViewController(animated: true)
    }

    @objc func prevArrowSubmarineAction() {
        var currIndex = submarines.firstIndex(of: submarineSetting.image ?? UIImage()) ?? 0
        if currIndex == 0 {
            currIndex = submarines.count - 1
        } else {
            currIndex -= 1
        }
        submarineSetting.image = submarines[currIndex]
    }
    
    @objc func nextArrowSubmarineAction() {
        var currIndex = submarines.firstIndex(of: submarineSetting.image ?? UIImage()) ?? 0
        if currIndex == submarines.count - 1 {
            currIndex = 0
        } else {
            currIndex += 1
        }
        submarineSetting.image = submarines[currIndex]
    }
    
    @objc func prevArrowEnemyTypeAction() {
        var currIndex = animals.firstIndex(of: enemySetting.image ?? UIImage()) ?? 0
        if currIndex == 0 {
            currIndex = animals.count - 1
        } else {
            currIndex -= 1
        }
        enemySetting.image = animals[currIndex]
    }
    
    @objc func nextArrowEnemyTypeAction() {
        var currIndex = animals.firstIndex(of: enemySetting.image ?? UIImage()) ?? 0
        if currIndex == animals.count - 1 {
            currIndex = 0
        } else {
            currIndex += 1
        }
        enemySetting.image = animals[currIndex]
    }
}

extension FifthGameSettingsVC: UIPickerViewDataSource {
    // сколько компонентов выводится
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // сколько строк в компоненте
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
}

extension FifthGameSettingsVC: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "\(row + 1)x speed"
        
        return result
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        gameSpeedSetting = row + 1
        print(row)
    }
}
