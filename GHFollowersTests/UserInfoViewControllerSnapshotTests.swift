//
//  UserInfoViewControllerSnapshotTests.swift
//  GHFollowersTests
//
//  Created by Kora on 30/04/2020.
//  Copyright © 2020 kbisewska. All rights reserved.
//

import XCTest
import SnapshotTesting

@testable import GHFollowers

class UserInfoViewControllerSnapshotTests: XCTestCase {
    
    var sut: UserInfoViewController!

    override func setUp() {
        super.setUp()
        sut = UserInfoViewController()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testUserInfoViewController() {
        sut.username = "test"
        sut.configureUIElements(with: User(login: "test", avatarUrl: "", name: nil, location: nil, bio: nil, publicRepos: 0, publicGists: 0, htmlUrl: "", following: 1, followers: 2, createdAt: .init(timeIntervalSince1970: 0)))
        assertSnapshot(matching: sut, as: .image(on: .iPhoneXr))
    }
}
