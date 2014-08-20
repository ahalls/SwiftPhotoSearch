//
//  ViewController.swift
//  PhotoSearch
//
//  Created by Andrew Halls on 8/19/14.
//  Copyright (c) 2014 GaltSoft. All rights reserved.
//

import UIKit

 class ViewController: UIViewController, UISearchBarDelegate {

  @IBOutlet  weak var searchBar: UISearchBar!
  @IBOutlet  weak var scrollView: UIScrollView!

  let instagramClientID = "d782212a48f44653bea97452dd87da2b"

  func searchInstagramByHashtag(searchString: String) {
    for subview in self.scrollView.subviews {
      subview.removeFromSuperview()
    }

    let instagramURLString = "https://api.instagram.com/v1/tags/" + searchString + "/media/recent?client_id=" + instagramClientID
    println("url: \(instagramURLString)")
    let manager = AFHTTPRequestOperationManager()

    manager.GET( instagramURLString,
      parameters: nil,
      success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
        // println("JSON: " + responseObject.description)

        if let dataArray = responseObject.valueForKey("data") as? [AnyObject] {
          self.scrollView.contentSize = CGSizeMake(320, CGFloat(320*dataArray.count))
          for var i = 0; i < dataArray.count; i++ {
            let dataObject: AnyObject = dataArray[i]
            if let imageURLString = dataObject.valueForKeyPath("images.standard_resolution.url") as? String {
              println("image " + String(i) + " URL is " + imageURLString)

              let imageData =  NSData(contentsOfURL: NSURL(string: imageURLString))
              let imageView = UIImageView(image: UIImage(data: imageData))
              imageView.frame = CGRectMake(0, CGFloat(320*i), 320, 320)
              self.scrollView.addSubview(imageView)
            }
          }
        }
      },
      failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
        println("Error: " + error.localizedDescription)
    })
  }


    func searchBarSearchButtonClicked(searchBar: UISearchBar!) {

    searchBar.resignFirstResponder()
    searchInstagramByHashtag(searchBar.text)
  }

   override func viewDidLoad() {
    super.viewDidLoad()
    assert( (scrollView != nil), "scrollView not linked in the Storyboard")
    assert( (searchBar?.delegate != nil), "searchBar.delegate not linked in the Storyboard")

    //searchInstagramByHashtag("clararockmore")
  }
   override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

//MARK:  Test Fixtures
//#if TEST

class Observer: NSObject {
  let function:() -> Void
  init(function: () -> Void) {
    self.function = function
  }
  override func observeValueForKeyPath( keyPath: String!, ofObject object: AnyObject!, change: [NSObject : AnyObject]!, context: UnsafeMutablePointer<()> ) {
    function()

  }


}
var  observerList = Array<Observer>()

extension ViewController {

   func searchFor (searchTerm: String) {
    self.searchBar.text = searchTerm
    self.searchBarSearchButtonClicked(self.searchBar)
  }

  func addSearchDataObserver(function: () -> Void) -> Void {
    println("\(self.scrollView)")
    let  observer = Observer(function)
    self.scrollView.addObserver(observer, forKeyPath: "contentSize", options: nil, context: nil)
    observerList.append(observer)
  }

 }
//#endif

