//
//  ViewController.swift
//  PhotoSearch
//
//  Created by Andrew Halls on 8/14/14.
//  Copyright (c) 2014 GaltSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var scrollView: UIScrollView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    let manager = AFHTTPRequestOperationManager()

    manager.GET( "https://api.instagram.com/v1/tags/clararockmore/media/recent?client_id=d782212a48f44653bea97452dd87da2b",
      parameters: nil,
      success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
        self.loadData(responseObject)
        //println("JSON: " + responseObject.description)
      },
      failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
        println("Error: " + error.localizedDescription)
    })


  }
  func loadData(responseObject: AnyObject!) {
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
  }
}


