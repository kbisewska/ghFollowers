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
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testTableFooterView() {
        let sut = UITableView()
        
        sut.removeExcessCells()
        
        XCTAssertNotNil(sut.tableFooterView)
        XCTAssertEqual(sut.tableFooterView!.subviews.count, 0)
    }
    
    func testDateConverter() {
        let date = Date.init(timeIntervalSince1970: 0)
        
        XCTAssertEqual(date.convertToMonthYearFormat(), "Jan 1970")
    }
    
    func testAddingSubviews() {
        let view = UIView()
        let subview1 = UIView()
        let subview2 = UIView()
        let subview3 = UIView()
        
        view.addSubviews(subview1, subview2, subview3)
        
        XCTAssertEqual(view.subviews, [subview1, subview2, subview3])
    }
}
