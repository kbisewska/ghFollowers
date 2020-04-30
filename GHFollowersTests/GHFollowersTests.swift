//
//  GHFollowersTests.swift
//  GHFollowersTests
//
//  Created by Kora on 10/04/2020.
//  Copyright © 2020 kbisewska. All rights reserved.
//

import XCTest

@testable import GHFollowers

class GHFollowersTests: XCTestCase {
    
    var sut: UITableView!

    override func setUp() {
        super.setUp()
        sut = UITableView()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testTableFooterView() {
        // act
        sut.removeExcessCells()
        
        // assert
        XCTAssertNotNil(sut.tableFooterView)
        XCTAssertEqual(sut.tableFooterView!.subviews.count, 0)
    }
}
