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

struct PersistanceManagerMock: PersistanceManageable {
    
    func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (ErrorMessage?) -> Void) {
    }
    
    func retrieveFavorites(completed: @escaping (Result<[Follower], ErrorMessage>) -> Void) {
        completed(.success([]))
    }
}

struct PersistanceManagerMock2: PersistanceManageable {
    
    func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (ErrorMessage?) -> Void) {
    }
    
    func retrieveFavorites(completed: @escaping (Result<[Follower], ErrorMessage>) -> Void) {
        completed(.success([
            Follower(login: "kbisewska", avatarUrl: "")
        ]))
    }
}

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
