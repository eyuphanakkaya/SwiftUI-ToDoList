//
//  UserDefaultsManager.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 2.03.2026.
//

import Foundation


final class UserDefaultsManager<T: Codable>: Persisting {
    typealias Item = T
    
    private let defaults: UserDefaults
    private let key: String = "userDefaultsKey"
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    func save(items: T) {
        let encoder = JSONEncoder()
        let encoded = try? encoder.encode(items)
        defaults.set(encoded, forKey: key)
    }
    
    func load() -> T? {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decoded = try? JSONDecoder().decode(T.self, from: data) else {
            return nil
        }
        
        return decoded
    }
    
    func delete() {
        defaults.removeObject(forKey: key)
    }
    
}
