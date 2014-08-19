//
//  InstagramService.swift
//  PhotoSearch
//
//  Created by Andrew Halls on 8/14/14.
//  Copyright (c) 2014 GaltSoft. All rights reserved.
//

import Foundation

class InstagramService {
    // Singleton Pattern
    // http://code.martinrue.com/posts/the-singleton-pattern-in-swift
    class var sharedInstance: InstagramService {
    struct Static {
      static var instance: InstagramService?
      static var token: dispatch_once_t = 0
      }

      dispatch_once(&Static.token) {
        Static.instance = InstagramService()
      }

      return Static.instance!
    }

}
