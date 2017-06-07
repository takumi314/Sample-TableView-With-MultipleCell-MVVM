//
//  Sample_TableView_With_MultipleCell_mvvmTests.swift
//  Sample-TableView-With-MultipleCell-mvvmTests
//
//  Created by NishiokaKohei on 2017/06/08.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import XCTest
@testable import Sample_TableView_With_MultipleCell_mvvm

class Sample_TableView_With_MultipleCell_mvvmTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testProfile() {
        let data = dataFromFile("TestData")
        let profile = Profile(data: data!)

        // Something else
    }

}
