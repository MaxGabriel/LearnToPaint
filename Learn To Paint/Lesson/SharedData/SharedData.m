//
//  SharedData.m
//  Learn To Paint
//
//  Created by Jack Murdock on 10/8/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import "SharedData.h"
#import "LessonObject.h"
#import "ArtworkParser.h"
#import "Oeuvre.h"

@implementation SharedData

+(NSArray *)sharedData
{
   
    static dispatch_once_t once;
    static NSArray *sharedData;
    dispatch_once(&once, ^{
        NSArray *tempArray = [[NSArray alloc] initWithObjects:
                               [[LessonObject alloc] initWithTitle:@"Lemon" description:@"Lemmon the Fruit of Itlay" identifier: @"" image:@"Lemon.JPG" movie:@"http://jackcreeksoftware.com/wp-includes/Work.mov" category:@"Painting"],
                              [[LessonObject alloc] initWithTitle:@"Banana" description:@"Description for all the lesson will go here." identifier: @"com.jackcreeksoftware.LearnToPaint.banana2" image:@"Bannna.JPG" movie:@"http://jackcreeksoftware.com/wp-includes/Banana.MOV" category:@"Sketch"],
                              [[LessonObject alloc] initWithTitle:@"Bush" description:@"This will be a basic overview of the Lessons" identifier: @"com.jackcreeksoftware.LearnToPaint.bush2" image:@"Bush.JPG" movie:@"http://jackcreeksoftware.com/wp-includes/Bush.mov" category:@"Sketch"],
                              [[LessonObject alloc] initWithTitle:@"Chair" description:@"You can have as many Lessons as you want." identifier: @"com.jackcreeksoftware.LearnToPaint.chair2" image:@"Chair.JPG" movie:@"http://jackcreeksoftware.com/wp-includes/Chair.MOV" category:@"Painting"],                          
                              nil];
        sharedData = [[NSArray alloc] initWithArray:tempArray];
    });
    return sharedData;
    
}

+(Oeuvre *)sharedOeuvre
{
    static dispatch_once_t once;
    static Oeuvre *oeuvre;
    dispatch_once(&once, ^{Oeuvre *tempoeuvre = [[Oeuvre alloc] init];
        //tempoeuvre = [ArtworkParser loadOeuvre:];
        oeuvre = tempoeuvre;
    });
    return oeuvre;
}

@end
