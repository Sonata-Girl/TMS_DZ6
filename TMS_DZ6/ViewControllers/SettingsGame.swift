//
//  SettingsGame.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 14.10.2022.
//

import UIKit


class SettingsGame: Codable {
    
    var gamerName: String
    var submarineIndex: Int
    var enemyIndex: Int
    var gameSpeed: Int
    var scores = [String: Int]()
    var submarines = [UIImage]()
    var animals = [UIImage]()
    
    init(gamerName: String, submarineIndex: Int, enemyIndex: Int, gameSpeed: Int, scores: [String: Int]) {
        self.gamerName = gamerName
        self.submarineIndex = submarineIndex
        self.enemyIndex = enemyIndex
        self.gameSpeed = gameSpeed
        self.scores = scores
        
        setArrays() 
    }
    
    init() {
        self.gamerName = ""
        self.submarineIndex = 0
        self.enemyIndex = 0
        self.gameSpeed = 5
       
        setArrays()
    }
    
    public enum CodingKeys: String, CodingKey {
        case gamerName, submarineIndex, enemyIndex, gameSpeed, scores
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.gamerName = try container.decode(String.self, forKey: .gamerName)
        self.submarineIndex = try container.decode(Int.self, forKey: .submarineIndex)
        self.enemyIndex = try container.decode(Int.self, forKey: .enemyIndex)
        self.gameSpeed = try container.decode(Int.self, forKey: .gameSpeed)
        self.scores = try container.decode(Dictionary.self, forKey: .scores)
        
        setArrays()
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.gamerName, forKey: .gamerName)
        try container.encode(self.submarineIndex, forKey: .submarineIndex)
        try container.encode(self.enemyIndex, forKey: .enemyIndex)
        try container.encode(self.gameSpeed, forKey: .gameSpeed)
        try container.encode(self.scores, forKey: .scores)
    }
    
    private func setArrays() {
        let submarine1 = UIImage(named: "submarine-1") ?? UIImage()
        let submarine2 = UIImage(named: "submarine-2") ?? UIImage()
        let submarine3 = UIImage(named: "submarine-3") ?? UIImage()
        
        self.submarines.append(submarine1)
        self.submarines.append(submarine2)
        self.submarines.append(submarine3)
        
        let animal1 = UIImage(named: "sharks") ?? UIImage()
        let animal2 = UIImage(named: "anglerfish") ?? UIImage()
        
        self.animals.append(animal1)
        self.animals.append(animal2)
    }
    
}

extension UserDefaults {
    
    func set<T: Encodable>(encodable: T, forKey key:String) {
        if let data = try? JSONEncoder().encode(encodable) {
            set(data, forKey: key)
        }
    }
    
    func value<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        if let data = object(forKey: key) as? Data,
           let value = try? JSONDecoder().decode(type, from: data) {
            return value
        }
        return nil
    }
}
