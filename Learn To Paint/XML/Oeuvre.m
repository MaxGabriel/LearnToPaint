//
//  Oeuvre.m
//  Learn To Paint
//
//  Created by Jack Murdock on 12/19/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import "Oeuvre.h"

@implementation Oeuvre
-(id) init
{
    self =[super init];
    if (self)
    {
        _artworks = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
