
import UIKit
import XCTest
import PhotoSearch

class ViewControllerTests: XCTestCase {

  func testItShouldLoad() {

    let storyBoard = UIStoryboard(name:"Main", bundle: nil)
    XCTAssertNotNil(storyBoard, "Test Not Configured Properly")

    let viewController: ViewController =
        storyBoard.instantiateInitialViewController() as ViewController
    XCTAssertNotNil(viewController, "Test Not Configured Properly")

    UIApplication.sharedApplication().keyWindow.rootViewController = viewController;

  }



func testItFetchData() {

  var storyBoard = UIStoryboard(name:"Main", bundle: nil)
  var viewController: ViewController? =
  storyBoard.instantiateInitialViewController() as? ViewController
  UIApplication.sharedApplication().keyWindow.rootViewController = viewController;


  XCTAssertNotNil(viewController?.searchBar?.delegate);
  viewController?.searchInstagramByHashtag("clararockmore")

  let scrollView = viewController?.scrollView
  XCTAssertNotNil(scrollView)

  var count = 0
  let expectedResult = 20

  let expectation = expectationWithDescription("Fetching Instagram Data")
  dispatch_async(dispatch_get_main_queue()) {
    for _ in 1...50 {
      //NSThread.sleepForTimeInterval(1)
      sleep(1)
      if let subs:NSArray  = scrollView?.subviews {
          count = subs.count
      }
      println("count: \(count)")
      if (count >= 20) {
          break
      }
    }
    XCTAssert(count == 20)
  }
  waitForExpectationsWithTimeout(10, { error in
      XCTFail("Test failed waiting for result with error: \(error?.description)")
  })

}
}
//  let expectation = expectationWithDescription("Fetching Instagram Data")
//
//  for _ in 1...50 {
//   // NSThread.sleepForTimeInterval(1)
//    var count = scrollView?.subviews.count
//    println("count: \(count)")
//    if count == 20 {
//      expectation.fulfill()
//      break
//    }
//    NSThread.sleepForTimeInterval(1000)
//  }
//  waitForExpectationsWithTimeout(10, { error in
//    XCTFail("Test failed waiting for result with error: \(error?.description)")
//  })
//
//  }

//}


//  func testItConnectIBOutlets() {
//    var storyBoard = UIStoryboard(name:"Main", bundle: nil)
//    XCTAssertNotNil(storyBoard, "Test Not Configured Properly")
//
//    var viewController: ViewController =
//    storyBoard.instantiateInitialViewController() as ViewController
//    XCTAssertNotNil(viewController, "Test Not Configured Properly")
//
//    XCTAssertNotNil(viewController.scrollView)
//    XCTAssertNotNil(viewController.searchBar?.delegate);
//
//
//  }
