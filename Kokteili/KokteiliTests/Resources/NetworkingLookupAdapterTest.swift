//
//  NetworkingLookupAdapterTest.swift
//  Kokteili
//
//  Created by Pedro Ramos on 28/01/25.
//

import XCTest
@testable import Kokteili

class NetworkingLookupAdapterTest: XCTestCase {
    var sut: NetworkingLookupAdapter!
    
    override func setUp() {
        super.setUp()
        sut = NetworkingLookupAdapter()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_success_DataExist() {
        // Given
        let exp = expectation(description: "Post request completed")
        var postResult: Result<EntityCocktail, Error>!
        self.setupNetworking(file: "LookupById", code: 200)
        
        // When
        sut.lookupBy(id: "11000") { (result) in
            postResult = result
            exp.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
        let actualInfo = try? postResult.get()
        
        // Then
        XCTAssertNotNil(actualInfo)
        XCTAssertEqual(actualInfo?.strDrink, "Mojito")
    }
    
    func test_failure_ErrorCode500() {
        // Given
        let exp = expectation(description: "Post request completed")
        var postResult: Result<EntityCocktail, Error>!
        self.setupNetworking(code: 500)
        
        // When
        sut.lookupBy(id: "11000") { (result) in
            postResult = result
            exp.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
        let actualInfo = try? postResult.get()
        
        // Then
        XCTAssertNil(actualInfo)
    }
    
    func test_failure_Error_Failed() {
        // Given
        let exp = expectation(description: "Post request completed")
        var postResult: Result<EntityCocktail, Error>!
        self.setupNetworking(code: 400, error: ErrorNetworking.failed)
        
        // When
        sut.lookupBy(id: "11000") { (result) in
            postResult = result
            exp.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
        let actualInfo = try? postResult.get()
        
        // Then
        XCTAssertNil(actualInfo)
    }
    
    private func setupNetworking(file: String = String(), code: Int, error: Error? = nil) {
        let router = MockRouter.shared.createMockSession(fromJsonFile: file, andStatusCode: code, andError: error, as: NetworkingLookupAPI.self)
        let service = NetworkingLookupService(router)
        sut = NetworkingLookupAdapter(service)
    }
}
