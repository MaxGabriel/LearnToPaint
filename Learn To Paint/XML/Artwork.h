//
//  Artwork.h
//  Learn To Paint
//
//  Created by Jack Murdock on 12/19/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artwork : NSObject
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *cost;
@property (nonatomic, strong, readonly) NSString *detail;
@property (nonatomic, strong, readonly) NSString *file;
@property (nonatomic, strong, readonly) NSURL *imageURL;

- (instancetype) initWithTitle:(NSString *)tmpTitle Cost:(NSString *)tmpCost Detail:(NSString *)tmpDetail imageURL:(NSURL *)imageURL;
@end
