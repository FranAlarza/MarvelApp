//
//  UserDefaultHelperTests.swift
//  MarvelAppTests
//
//  Created by Francisco Javier Alarza Sanchez on 15/10/22.
//

import XCTest
@testable import MarvelApp

final class UserDefaultHelperTests: XCTestCase {
    
    var sut: UserDefaultsHelper?

    override func setUpWithError() throws {
        sut = UserDefaultsHelper()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testSaveHeroesSuccess() throws {
        //Given
        let key = "test"
        let series: [Series] = [Series(id: 1, title: "Spiderman", resultDescription: "", thumbnail: ThumbnailSerie(path: "", thumbnailExtension: ""))]
        
        //When
        sut?.save(series: series, key: key)
        let result = sut?.load(key: key)
        
        //Then
        XCTAssertTrue(result?.count == 1)
    }
    
    func testDeleteHeroesSuccess() throws {
        //Given
        let key = "test"
        
        
        //When
        sut?.delete(key: key)
        let result = sut?.load(key: key)
        
        //Then
        XCTAssertTrue(result?.count == 0)
    }


}
