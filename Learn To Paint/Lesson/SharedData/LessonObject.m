//
//  LessonObject.m
//  Learn To Paint
//
//  Created by Jack Murdock on 10/8/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import "LessonObject.h"

@implementation LessonObject

-(id)initWithTitle:(NSString *)tempTitle description:(NSString *)tempDescription identifier:(NSString *)productIdentifier image:(NSString *) tempImage movie:(NSString *)tempMovie category:(NSString *)tempCategory
{
    
    //Creating the Lesson Object
    self = [super init];
    if (self)
    {
        _titleOfLesson = tempTitle;
        _descriptionOfLesson = tempDescription;
        _identifierOfLesson = productIdentifier;
        _imageOfLesson = tempImage;
        _movieURLOfLesson = tempMovie;
        _categoryOfLesson = tempCategory;
    }
    
    return self;
}


@end
