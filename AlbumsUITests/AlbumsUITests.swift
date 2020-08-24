//
//  AlbumsUITests.swift
//  AlbumsUITests
//
//  Created by Nitish.kumar on 23/08/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import XCTest

class AlbumsUITests: XCTestCase {

    var app : XCUIApplication!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
//
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
    
    func testListsubViews() {
        let tableView = app.tables["AlbumListTableView"]
        XCTAssertTrue(tableView.exists)
        
        let cell = tableView.cells["AlbumListCell_0"]
        XCTAssertTrue(cell.exists)
        
    
        let artistNameLabel = tableView.cells["AlbumListCell_0"].staticTexts["artistNameLabel"]
        XCTAssert(artistNameLabel.exists)
        
        let trackNameLabel = tableView.cells["AlbumListCell_0"].staticTexts["trackNameLabel"]
        XCTAssert(trackNameLabel.exists)
        
        let collectionNameLabel = tableView.cells["AlbumListCell_0"].staticTexts["collectionNameLabel"]
        XCTAssert(collectionNameLabel.exists)
        
        let collectionPriceLabel = tableView.cells["AlbumListCell_0"].staticTexts["collectionPriceLabel"]
        XCTAssert(collectionPriceLabel.exists)
        
        
        let profileImageView = tableView.cells["AlbumListCell_0"].images["profileImageView"]
        XCTAssert(profileImageView.exists)
        
        
    }
}
