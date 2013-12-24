//
//  Artwork.h
//  Learn To Paint
//
//  Created by Jack Murdock on 12/19/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artwork : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *cost;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSString *file;

-(id) initWithTitle:(NSString *)tmpTitle Cost:(NSString *)tmpCost Detail:(NSString *)tmpDetail File:(NSString *)tmpFile;
@end
