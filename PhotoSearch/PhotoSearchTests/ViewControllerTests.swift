//
//  ViewControllerTests.swift
//  PhotoSearch
//
//  Created by Andrew Halls on 8/14/14.
//  Copyright (c) 2014 GaltSoft. All rights reserved.
//

import UIKit
import XCTest

class ViewControllerTests: XCTestCase {
  //  var storyBoard = UIStoryboard(name:"Main", bundle: nil)
  // XCTAssertNotNil(storyBoard, "Test Not Configured Properly")

  //  var viewController: AnyObject! = storyBoard.instantiateViewControllerWithIdentifier("ViewController")

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
        XCTAssert(true, "Pass")
    }

  func testViewControllerLoad() {
    var storyBoard: AnyObject! = UIStoryboard(name:"Main", bundle: nil)
    XCTAssert(storyBoard != nil, "Test Not Configured Properly")

    var viewController: AnyObject! = storyBoard.instantiateViewControllerWithIdentifier("ViewController")
    XCTAssert(viewController != nil, "Test Not Configured Properly")


    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
