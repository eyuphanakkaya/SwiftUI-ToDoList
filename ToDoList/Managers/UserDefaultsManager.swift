//
//  UserDefaultsManager.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 2.03.2026.
//

import Foundation


final class UserDefaultsManager: Persisting {
    private let defaults: UserDefaults
    private let key: String = "userDefaultsKey"
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    func save(items: [ItemModel]) {
        let encoder = JSONEncoder()
        let encoded = try? encoder.encode(items)
        defaults.set(encoded, forKey: key)
    }
    
    func load() -> [ItemModel]? {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decoded = try? JSONDecoder().decode([ItemModel].self, from: data) else {
            return nil
        }
        
        return decoded
    }
    
    func delete() {
        defaults.removeObject(forKey: key)
    }
    
}
