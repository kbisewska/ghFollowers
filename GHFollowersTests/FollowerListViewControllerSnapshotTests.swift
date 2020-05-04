//
//  FollowerListViewControllerSnapshotTests.swift
//  GHFollowersTests
//
//  Created by Kora on 04/05/2020.
//  Copyright © 2020 kbisewska. All rights reserved.
//

import XCTest
import SnapshotTesting

@testable import GHFollowers

class FollowerListViewControllerSnapshotTests: XCTestCase {
    
    var sut: FollowerListViewController!

    override func setUp() {
        super.setUp()
        sut = FollowerListViewController(username: "test")
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testEmptyFollowerListViewController() {
        sut.persistanceManager = PersistanceManagerMock()
        let message = "This user doesn't have any followers. Go follow them."
        sut.showEmptyStateView(with: message, in: sut.view)
        assertSnapshot(matching: sut, as: .image(on: .iPhoneXr))
    }
}
