//
//  UserDafaultHelper.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 19/10/22.
//

import Foundation

final class UserDefaultsHelper{
    private let FAV_KEY = "FAV_KEY"
    
    func save(series: Set<Series>) {
        if let encoded = try? JSONEncoder().encode(series) {
            UserDefaults.standard.set(encoded, forKey: FAV_KEY)
        }
    }
    
    func load() -> Set<Series> {
        if let savedSeries = UserDefaults.standard.object(forKey: FAV_KEY) as? Data {
            if let loadedSeries = try? JSONDecoder().decode(Set<Series>.self, from: savedSeries) {
                return loadedSeries
            }
        }
        return Set<Series>()
    }
    
    func delete() {
        UserDefaults.standard.removeObject(forKey: FAV_KEY)
    }
    
    
}
