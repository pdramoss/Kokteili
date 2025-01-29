//
//  NetworkingSearchAdapterTest.swift
//  KokteiliTests
//
//  Created by Pedro Ramos on 27/01/25.
//

import XCTest
@testable import Kokteili

class NetworkingSearchAdapterTest: XCTestCase {
    
    var sut: NetworkingSearchAdapter!
    
    override func setUp() {
        super.setUp()
        sut = NetworkingSearchAdapter()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_success_DataExist() {
        // Given
        let exp = expectation(description: "Post request completed")
        var postResult: Result<[EntityCocktail], Error>!
        self.setupNetworking(file: "SearchByName", code: 200)
        
        // When
        sut.searchBy(name: "Quino") { (result) in
            postResult = result
            exp.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
        let actualInfo = try? postResult.get()
        
        // Then
        XCTAssertNotNil(actualInfo)
        XCTAssertEqual(actualInfo?.count, 6)
        XCTAssertEqual(actualInfo?.first?.strDrink, "Margarita")
    }
    
    func test_success_Data_NotExist() {
        // Given
        let exp = expectation(description: "Post request completed")
        var postResult: Result<[EntityCocktail], Error>!
        self.setupNetworking(code: 200)
        
        // When
        sut.searchBy(name: "Quino") { (result) in
            postResult = result
            exp.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
        let actualInfo = try? postResult.get()
        
        // Then
        XCTAssertNil(actualInfo)
    }
    
    private func setupNetworking(file: String = String(), code: Int, error: Error? = nil) {
        let router = MockRouter.shared.createMockSession(fromJsonFile: file, andStatusCode: code, andError: error, as: NetworkingSearchAPI.self)
        let service = NetworkingSearchService(router)
        sut = NetworkingSearchAdapter(service)
    }
}
