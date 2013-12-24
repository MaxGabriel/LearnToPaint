//
//  SharedData.h
//  Learn To Paint
//
//  Created by Jack Murdock on 10/8/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Oeuvre;
@interface SharedData : NSObject
+(NSArray *)sharedData;
+(Oeuvre *)sharedOeuvre;
@end
