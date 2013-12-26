//
//  Artwork.m
//  Learn To Paint
//
//  Created by Jack Murdock on 12/19/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import "Artwork.h"

@implementation Artwork
-(instancetype) initWithTitle:(NSString *)tmpTitle Cost:(NSString *)tmpCost Detail:(NSString *)tmpDetail imageURL:(NSURL *)imageURL
{
    self = [super init];
    if (self)
    {
        _title = tmpTitle;
        if (_title == nil) { return nil; }
        
        _cost = tmpCost;
        if (_cost == nil) { return nil; }
        
        _detail = tmpDetail;
        if (_detail == nil) { return nil; }
        
        _imageURL = imageURL;
        if (_imageURL == nil) { return nil; }
    }

    return self;
}
@end
