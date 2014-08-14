//
//  ViewController.swift
//  PhotoSearch
//
//  Created by Andrew Halls on 8/14/14.
//  Copyright (c) 2014 GaltSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    let manager = AFHTTPRequestOperationManager()

    manager.GET( "https://api.instagram.com/v1/tags/clararockmore/media/recent?client_id=d782212a48f44653bea97452dd87da2b",
      parameters: nil,
      success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
        println("JSON: " + responseObject.description)
      },
      failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
        println("Error: " + error.localizedDescription)
    })


  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

