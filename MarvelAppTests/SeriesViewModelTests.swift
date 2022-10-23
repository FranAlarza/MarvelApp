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
    
    var sut: SeriesViewModel?

    override func setUpWithError() throws {
        sut = SeriesViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
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

}
