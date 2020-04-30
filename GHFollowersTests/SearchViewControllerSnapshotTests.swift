//
//  SearchViewControllerSnapshotTests.swift
//  GHFollowersTests
//
//  Created by Kora on 10/04/2020.
//  Copyright © 2020 kbisewska. All rights reserved.
//

import XCTest
import SnapshotTesting

@testable import GHFollowers

class SearchViewControllerSnapshotTests: XCTestCase {
    
    var sut: SearchViewController!

    override func setUp() {
        super.setUp()
        sut = SearchViewController()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSearchViewControllerSnapshot() {
        assertSnapshot(matching: sut, as: .image(on: .iPhoneXr))
    }
}
