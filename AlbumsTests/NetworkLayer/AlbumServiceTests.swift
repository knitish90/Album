//
//  AlbumServiceTests.swift
//  AlbumTests
//
//  Created by Nitish.kumar on 30/03/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import XCTest
@testable import Albums

class AlbumServiceTests: XCTestCase {

    var expectation : XCTestExpectation!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        expectation = self.expectation(description: "It should load Alumbs")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testAlbumList_Success() {
        //let client = MockedHTTPClient(mockedData: testAlbumJson, error: nil)
        let service = MockedAlbumservice(albumString: testAlbumJson)
        
        var album  : Album?
        service.getAlbumList(completion: { (error, albumData) in
            album = albumData
            self.expectation.fulfill()
        })
        
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertTrue(album != nil)
    }
    
    func testLoadAlbum_Failure() {
        let client = MockedHTTPClient(mockedData: nil, error: nil)
        let service = Albumservice(httpClient: client)
        
        var album  : Album?
        service.getAlbumList { (error, albumData) in
            album    =   albumData
            self.expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertTrue(album == nil)
    }
}
