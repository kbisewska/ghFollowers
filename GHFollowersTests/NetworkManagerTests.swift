//
//  NetworkManagerTests.swift
//  GHFollowersTests
//
//  Created by Kora on 04/05/2020.
//  Copyright © 2020 kbisewska. All rights reserved.
//

import XCTest
import OHHTTPStubs
import OHHTTPStubsSwift

@testable import GHFollowers

class NetworkManagerTests: XCTestCase {
    
    var sut: NetworkManager!

    override func setUp() {
        super.setUp()
        sut = NetworkManager.shared
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testGetFollowersInvalidResponse() {
        stub(condition: isHost("api.github.com"), response: { _ in
            let obj = [:] as [String : Any]
            return HTTPStubsResponse(jsonObject: obj, statusCode: 500, headers: nil)
        })
        
        let expect = expectation(description: "network response")
        var response: Result<[Follower], ErrorMessage>?
        
        sut.getFollowers(for: "", page: 1) { result in
            response = result
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1.0)
        XCTAssertEqual(response, Result<[Follower], ErrorMessage>.failure(.invalidResponse))
    }
    
    func testGetFollowersInvalidData() {
        stub(condition: isHost("api.github.com"), response: { _ in
            let obj = ["key1":"value1", "key2":["value2A","value2B"]] as [String : Any]
            return HTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
        })
        
        let expect = expectation(description: "network response")
        var response: Result<[Follower], ErrorMessage>?
        
        sut.getFollowers(for: "", page: 1) { result in
            response = result
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1.0)
        XCTAssertEqual(response, Result<[Follower], ErrorMessage>.failure(.invalidData))
    }
    
    func testGetFollowersValidData() {
        stub(condition: isHost("api.github.com"), response: { _ in
            let obj = [["login":"test", "avatarUrl":"test"]] as [[String : String]]
            return HTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
        })
        
        let expect = expectation(description: "network response")
        var response: Result<[Follower], ErrorMessage>?
        
        sut.getFollowers(for: "", page: 1) { result in
            response = result
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1.0)
        
        XCTAssertNotNil(try? response?.get())
        XCTAssertEqual(try? response?.get().count, 1)
        
        let follower = try? response?.get().first
        XCTAssertEqual(follower?.login, "test")
        XCTAssertEqual(follower?.avatarUrl, "test")
        XCTAssertEqual(response, Result<[Follower], ErrorMessage>.success([follower!]))
    }
    
    func testGetUserInfoInvalidResponse() {
        stub(condition: isHost("api.github.com"), response: { _ in
            let obj = [:] as [String : Any]
            return HTTPStubsResponse(jsonObject: obj, statusCode: 500, headers: nil)
        })
        
        let expect = expectation(description: "network response")
        var response: Result<User, ErrorMessage>?
        
        sut.getUserInfo(for: "") { result in
            response = result
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1.0)
        XCTAssertEqual(response, Result<User, ErrorMessage>.failure(.invalidResponse))
    }
    
    func testGetUserInfoInvalidData() {
        stub(condition: isHost("api.github.com"), response: { _ in
            let obj = ["key1":"value1", "key2":["value2A","value2B"]] as [String : Any]
            return HTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
        })
        
        let expect = expectation(description: "network response")
        var response: Result<User, ErrorMessage>?
        
        sut.getUserInfo(for: "") { result in
            response = result
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1.0)
        XCTAssertEqual(response, Result<User, ErrorMessage>.failure(.invalidData))
    }
}
