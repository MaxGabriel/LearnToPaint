//
//  ArtworkParser.h
//  XMLTesting
//
//  Created by Jack Murdock on 12/18/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Oeuvre;
@interface ArtworkParser : NSObject
+(Oeuvre *)loadOeuvre:(NSString *)filePath;
@end
