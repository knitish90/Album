//
//  AlbumViewModelTest.swift
//  AlbumsTests
//
//  Created by Nitish.kumar on 24/08/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import XCTest
@testable import Albums

class AlbumViewModelTest: XCTestCase {

    var expectation : XCTestExpectation!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        expectation = self.expectation(description: "It should load album list")
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


   

    func testFetchAlbumList() {
        let service = MockedAlbumservice(albumString: testAlbumJson)
        let viewModel = AlbumListViewModel(service: service)
        viewModel.fetchAlbums()
        
        viewModel.didDataLoaded = { (error) in
            self.expectation.fulfill()
        }
        waitForExpectations(timeout: 15, handler: nil)
        XCTAssert(viewModel.dataSource.count > 0)
    }
    
}
