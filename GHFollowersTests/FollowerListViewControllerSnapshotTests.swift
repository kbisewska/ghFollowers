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

class NetworkManagerMock: NetworkManageable {
    
    var cache = NSCache<NSString, UIImage>()
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], ErrorMessage>) -> Void) {
        completed(.success([]))
    }
    
    func getUserInfo(for username: String, completed: @escaping (Result<User, ErrorMessage>) -> Void) {
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
    }
}

class FollowerListViewControllerSnapshotTests: XCTestCase {
    
    var sut: FollowerListViewController!

    override func setUp() {
        super.setUp()
        sut = FollowerListViewController(username: "kbisewska")
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func userInfoViewControllerSnapshotTests() {
        sut.networkManager = NetworkManagerMock()
        assertSnapshot(matching: sut, as: .image(on: .iPhoneXr))
    }
}
