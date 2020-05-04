//
//  PersistanceManagerMocks.swift
//  GHFollowersTests
//
//  Created by Kora on 04/05/2020.
//  Copyright © 2020 kbisewska. All rights reserved.
//

import Foundation

@testable import GHFollowers

struct PersistanceManagerMock: PersistanceManageable {
    
    func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: (ErrorMessage?) -> Void) {
    }
    
    func retrieveFavorites(completed: (Result<[Follower], ErrorMessage>) -> Void) {
        completed(.success([]))
    }
}

struct PersistanceManagerMock2: PersistanceManageable {
    
    func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: (ErrorMessage?) -> Void) {
    }
    
    func retrieveFavorites(completed: (Result<[Follower], ErrorMessage>) -> Void) {
        completed(.success([
            Follower(login: "test", avatarUrl: "")
        ]))
    }
}
