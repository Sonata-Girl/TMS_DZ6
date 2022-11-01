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
    let getFileButton = UIButton()
    let textFile = UILabel()
    
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
      
        getFileButton.setTitle("get text file", for: .normal)
        getFileButton.backgroundColor = .systemYellow
        
        textFile.text = "Start game"
       
        view.addSubview(closeButton)
        view.addSubview(settingsButton)
        view.addSubview(startGameButton)
        view.addSubview(scoresButton)
        view.addSubview(getFileButton)
        view.addSubview(textFile)
        
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        startGameButton.addTarget(self, action: #selector(startGameButtonAction), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(settingsButtonAction), for: .touchUpInside)
        scoresButton.addTarget(self, action: #selector(scoresButtonAction), for: .touchUpInside)
        getFileButton.addTarget(self, action: #selector(getFileButtonAction), for: .touchUpInside)
       
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
        
        getFileButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            getFileButton.topAnchor.constraint(equalTo: scoresButton.bottomAnchor, constant: 20),
            getFileButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            getFileButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            getFileButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        textFile.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFile.topAnchor.constraint(equalTo: getFileButton.bottomAnchor, constant: 20),
            textFile.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            textFile.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            textFile.heightAnchor.constraint(equalToConstant: 30)
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
    
    @IBAction func getFileButtonAction() {
        let file = "input.txt"
        var newFileText = ""
        var text = ""
//        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
//        let fileURL = directory.appendingPathComponent(file)
//        if FileManager.default.fileExists(atPath: fileURL.path) {
//            let fileURL = directory.appendingPathComponent(file)
//
//               //reading
//               do {
//                   text2 = try String(contentsOf: fileURL, encoding: .utf8)
//               }
//               catch {/* error handling here */}
//        }
//
//        let elements = text2.components(separatedBy: " ")
//        var sum = 0
//        for i in elements {
//            sum += Int(i) ?? 0
//        }
//        newFileText = String(sum)
//
//        textFile.text = newFileText
//        let fileName = "output.txt"
//        let fileURL2 = directory.appendingPathComponent(fileName) //
//        if FileManager.default.fileExists(atPath: fileURL2.path) {
//            let fileURL2 = directory.appendingPathComponent(fileName)
//
//            if FileManager.default.fileExists(atPath: fileURL2.path) {
//                do {
//                    try FileManager.default.removeItem(atPath: fileURL2.path)
//                } catch let error {
//                    print("couldn't remove file with error", error)
//                }
//            }
//
//            do {
//                try newFileText.write(to: fileURL, atomically: false, encoding: .utf8)
//            } catch let error{
//                print("error saving file with error", error)
//            }
//        }

        var inString = ""
        do {
            inString = try String(contentsOfFile: "input.txt")
        } catch {
            
            print("Failed reading from input.txt, Error: " + error.localizedDescription)
        }
        let input = inString.dropLast()
        //print(input)
        //let input = readLine() ?? ""
        let nums = input.split(separator: " ")
        print(nums)
        var result = 0
        nums.forEach {
            let num = Int($0)!
            result += num
        }
        //var outString = ""
        let outString = String(result)
        do {
            try outString.write(to: URL(fileURLWithPath: "output.txt"), atomically: true, encoding: .utf8)
        } catch {
            
            print("Failed reading from output.txt, Error: " + error.localizedDescription)
        }
    }
}
