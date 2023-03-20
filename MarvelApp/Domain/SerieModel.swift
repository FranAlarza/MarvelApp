//
//  SerieModel.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 16/10/22.
//

import Foundation

struct DataSeriesResult: Codable {
    let data: DataSeries
}

// MARK: - DataClass
struct DataSeries: Codable {
    let results: [Series]
}

// MARK: - Result
struct Series: Codable, Identifiable, Hashable {
    
    let id: Int
    let title: String
    let resultDescription: String?
    let thumbnail: ThumbnailSerie

    enum CodingKeys: String, CodingKey {
        case id, title
        case resultDescription = "description"
        case thumbnail
    }
}


// MARK: - Thumbnail
struct ThumbnailSerie: Codable, Hashable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
