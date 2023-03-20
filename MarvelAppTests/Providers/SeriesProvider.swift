//
//  SeriesProvider.swift
//  MarvelAppTests
//
//  Created by Francisco Javier Alarza Sanchez on 21/3/23.
//

import Foundation
class SeriesProvider {
    func saveSerie() {
        let userDefaults = UserDefaultsHelper()
        let series: Set<Series> = [Series(id: 1, title: "Spiderman", resultDescription: "", thumbnail: ThumbnailSerie(path: "", thumbnailExtension: ""))]
        
        userDefaults.save(series: series)
    }
    
    func provideFav() -> Series {
        return Series(id: 2, title: "Superman", resultDescription: "", thumbnail: ThumbnailSerie(path: "", thumbnailExtension: ""))
    }
    
    func saveManyFavs() {
        
    }
}
