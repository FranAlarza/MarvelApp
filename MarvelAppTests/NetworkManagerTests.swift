//
//  NetworkManagerTests.swift
//  MarvelAppTests
//
//  Created by Francisco Javier Alarza Sanchez on 22/10/22.
//

import XCTest
@testable import MarvelApp

final class NetworkManagerTests: XCTestCase {
    
    var sut: NetworkManager?

    override func setUpWithError() throws {
        sut = NetworkManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGetSessionHeroesSuccess() throws {
        // Given
        // When
        let urlSession = sut?.getSessionHeroes()
        let httpMethod = urlSession?.httpMethod
        // Then
        
        XCTAssertNotNil(urlSession)
        XCTAssertEqual(HTTPMethods.get, httpMethod)
    }
    
    func testGetSessionSeriesSuccess() throws {
        // Given
  
        // When
        let urlSession = sut?.getSessionSeries(from: "1")
        let httpMethod = urlSession?.httpMethod
        // Then
        
        XCTAssertNotNil(urlSession)
        XCTAssertEqual(HTTPMethods.get, httpMethod)
    }

}
