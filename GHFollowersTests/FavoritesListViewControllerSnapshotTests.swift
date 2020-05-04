//
//  FavoritesListViewControllerSnapshotTests.swift
//  GHFollowersTests
//
//  Created by Kora on 30/04/2020.
//  Copyright © 2020 kbisewska. All rights reserved.
//

import XCTest
import SnapshotTesting

@testable import GHFollowers

class FavoritesListViewControllerSnapshotTests: XCTestCase {
    
    var sut: FavoritesListViewController!

    override func setUp() {
        sut = FavoritesListViewController()
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testEmptyFavoritesListViewController() {
        sut.persistanceManager = PersistanceManagerMock()
        assertSnapshot(matching: sut, as: .image(on: .iPhoneXr))
    }
    
    func testFilledFavoritesListViewController() {
        sut.persistanceManager = PersistanceManagerMock2()
        assertSnapshot(matching: sut, as: .image(on: .iPhoneXr))
    }
}
