//
//  NetworkManagerTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Tekla Matcharashvili on 03.12.23.
//

import XCTest
@testable import UnitTestingAssignment
final class NetworkManagerTests: XCTestCase {
    
    var networkManager: NetworkManager!
    
    override func setUp() {
        super.setUp()
        networkManager = NetworkManager()
    }
    
    override func tearDown() {
        networkManager = nil
        super.tearDown()
    }
    
    func testFetchProductsSuccess() {
        let expectation = XCTestExpectation(description: "Fetch products should succeed")
        
        networkManager.fetchProducts { result in
            switch result {
            case .success(let products):
                XCTAssertNotNil(products, "Products should not be nil on success")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Fetching products failed with error: \(error)")
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
}
