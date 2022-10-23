//
//  UserDafaultHelper.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 19/10/22.
//

import Foundation

class UserDefaultsHelper{
    
    func save(series: [Series], key: String = "FAV_KEY") {
        if let encoded = try? JSONEncoder().encode(series) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    func load(key: String = "FAV_KEY") -> [Series] {
        if let data = UserDefaults.standard.object(forKey: key) as? Data,
          let series = try? JSONDecoder().decode([Series].self, from: data) {
            return series
        }
        return [Series]()
    }
    
    func delete(key: String = "FAV_KEY") {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    
}
