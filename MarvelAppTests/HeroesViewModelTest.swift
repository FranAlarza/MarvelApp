//
//  HeroesViewModel.swift
//  MarvelAppTests
//
//  Created by Francisco Javier Alarza Sanchez on 22/10/22.
//

import XCTest
import Combine
import SwiftUI
@testable import MarvelApp

final class HeroesViewModelTest: XCTestCase {
    
    var sut: HeroesViewModel?

    override func setUpWithError() throws {
        sut = HeroesViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGetHeroes() throws {
        // Given
        var suscriptor = Set<AnyCancellable>()
        
        let expectation = self.expectation(description: "Descarga la foto")

        // When
        sut?.heroes.publisher
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
        
        //Then
        sut?.getHeroes()
        
        self.waitForExpectations(timeout: 10)
    }
    
}
