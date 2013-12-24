//
//  LessonObject.h
//  Learn To Paint
//
//  Created by Jack Murdock on 10/8/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LessonObject : NSObject

@property (strong, nonatomic)NSString *titleOfLesson;
@property (strong, nonatomic)NSString *descriptionOfLesson;
@property (strong, nonatomic)NSString *imageOfLesson;
@property (strong, nonatomic)NSString *identifierOfLesson;
@property (strong, nonatomic)NSString *movieURLOfLesson;
@property (strong, nonatomic)NSString *categoryOfLesson;


-(id)initWithTitle:(NSString *)tempTitle description:(NSString *)tempDescription identifier:(NSString *)productIdentifier image:(NSString *) tempImage movie:(NSString *)tempMovie category:(NSString *)tempCategory;

@end
