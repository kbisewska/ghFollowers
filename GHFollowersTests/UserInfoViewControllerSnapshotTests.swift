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

class NetworkManagerMock: NetworkManageable {
    var cache = NSCache<NSString, UIImage>()
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], ErrorMessage>) -> Void) {
    }
    
    func getUserInfo(for username: String, completed: @escaping (Result<User, ErrorMessage>) -> Void) {
        completed(.success(
            User(login: "kbisewska", avatarUrl: "", name: "Kornelia", location: "Poland", bio: nil, publicRepos: 99, publicGists: 99, htmlUrl: "/kbisewska", following: 99, followers: 99, createdAt: .init(timeIntervalSince1970: 0))
        ))
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
    }
}

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

    func userInfoViewControllerSnapshotTests() {
        sut.networkManager = NetworkManagerMock()
        assertSnapshot(matching: sut, as: .image(on: .iPhoneXr))
    }
}
