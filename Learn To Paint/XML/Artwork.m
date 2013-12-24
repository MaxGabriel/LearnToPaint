//
//  Artwork.m
//  Learn To Paint
//
//  Created by Jack Murdock on 12/19/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import "Artwork.h"

@implementation Artwork
-(id) initWithTitle:(NSString *)tmpTitle Cost:(NSString *)tmpCost Detail:(NSString *)tmpDetail File:(NSString *)tmpFile
{
    self = [super init];
    if (self)
    {
        _title = tmpTitle;
        _cost = tmpCost;
        _detail = tmpDetail;
        _file = tmpFile;
    }
    return self;
}
@end
