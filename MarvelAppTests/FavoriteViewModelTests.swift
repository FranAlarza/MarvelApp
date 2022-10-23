//
//  FavoriteViewModelTests.swift
//  MarvelAppTests
//
//  Created by Francisco Javier Alarza Sanchez on 22/10/22.
//

import XCTest
@testable import MarvelApp

final class FavoriteViewModelTests: XCTestCase {
    
    var sut: FavoritesSeriesViewModel?
    
    override func setUpWithError() throws {
        sut = FavoritesSeriesViewModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        sut?.favorites.removeAll()
    }
    
    func testsaveFavorites() throws {
        // Given
        let serieTest = Series(id: 1, title: "Spiderman", resultDescription: "",
                               thumbnail: ThumbnailSerie(path: "", thumbnailExtension: ""))
        sut?.saveFavorite(serie: serieTest)
        
        XCTAssertTrue(sut?.favorites.count ?? 0 > 0)
    }
    
    func testDeleteFavoriteSerie() {
        let serieTest = Series(id: 1, title: "Spiderman", resultDescription: "",
                               thumbnail: ThumbnailSerie(path: "", thumbnailExtension: ""))
        sut?.saveFavorite(serie: serieTest)
        sut?.deleteRow(from: 1)

        XCTAssertNotNil(sut?.favorites)
    }
    
}
