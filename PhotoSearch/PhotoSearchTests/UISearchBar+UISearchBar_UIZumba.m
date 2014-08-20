//
//  UISearchBar+UISearchBar_UIZumba.m
//  PhotoSearch
//
//  Created by Andrew Halls on 8/20/14.
//  Copyright (c) 2014 GaltSoft. All rights reserved.
//

#import "UISearchBar+UISearchBar_UIZumba.h"

@implementation UISearchBar (UISearchBar_UIZumba)

-(void)searchFor: (NSString *) searchTerm {

  self.text = searchTerm;
  [self performSelector:@selector(trash)];

}

@end
