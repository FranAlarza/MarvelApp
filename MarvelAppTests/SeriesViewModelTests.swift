//
//  SeriesViewModelTests.swift
//  MarvelAppTests
//
//  Created by Francisco Javier Alarza Sanchez on 22/10/22.
//

import Combine
import XCTest
@testable import MarvelApp

final class SeriesViewModelTests: XCTestCase {
    
    var sut: SeriesViewModel!
    var provider: SeriesProvider!

    override func setUpWithError() throws {
        sut = SeriesViewModel()
        provider = SeriesProvider()
    }

    override func tearDownWithError() throws {
        sut = nil
        provider = nil
        UserDefaultsHelper().delete()
    }

    func testGetSeries() throws {
        var suscriptor = Set<AnyCancellable>()
        
        let expectation = self.expectation(description: "Descarga la foto")

        sut?.series.publisher
            .sink { completion in
                //Finaliza
                switch completion{
                case .finished:
                    XCTAssertEqual(1,1)
                    expectation.fulfill()
                case .failure:
                    XCTAssertEqual(1,2)
                    expectation.fulfill()
                }
            } receiveValue: { heroes in
                XCTAssertEqual(1,1)
                expectation.fulfill()
            }
            .store(in: &suscriptor)
        
        sut?.getSeries(id: "1")
        
        self.waitForExpectations(timeout: 10)
    }
    
    func testFetchFavoritesSuccess() {
        // Given
        provider.saveSerie()
        
        // Then
        sut.fetchFavorites()
        
        // When
        XCTAssertTrue(!sut.favorites.isEmpty)
    }
    
    func testSaveFavorite() {
        // Given
        let fav = provider.provideFav()
        let userDefaults = UserDefaultsHelper()
        
        // When
        sut.saveFavorite(serie: fav)
        let favorites = userDefaults.load()
        
        // Then
        XCTAssertTrue(!favorites.isEmpty)
    }
    
    func testDeleteFavorite() {
        // Given
        let fav = provider.provideFav()
        let userDefaults = UserDefaultsHelper()
        
        // When
        sut.saveFavorite(serie: fav)
        let favorites = userDefaults.load()
        
        // Then
        XCTAssertTrue(!favorites.isEmpty)
        
        // When
        sut.deleteFavorite(from: fav)
        
        // Then
        XCTAssertTrue(sut.favorites.isEmpty)
    }

}
