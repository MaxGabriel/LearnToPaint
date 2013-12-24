//
//  PaintingIAPHelper.m
//  Learn To Paint
//
//  Created by Jack Murdock on 10/15/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import "PaintingIAPHelper.h"

@implementation PaintingIAPHelper

+ (PaintingIAPHelper *)sharedInstance {
    static dispatch_once_t once;
    static PaintingIAPHelper * sharedInstance;
    dispatch_once(&once, ^{
        NSSet * productIdentifiers = [NSSet setWithObjects:
                                      @"com.jackcreeksoftware.LearnToPaint.banana2",
                                      @"com.jackcreeksoftware.LearnToPaint.bush2",
                                      @"com.jackcreeksoftware.LearnToPaint.chair2",
                                      nil];
        sharedInstance = [[self alloc] initWithProductIdentifiers:productIdentifiers];
    });
    return sharedInstance;
}

@end
