//
//  ArtworkParser.m
//  XMLTesting
//
//  Created by Jack Murdock on 12/18/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import "ArtworkParser.h"
#import "Oeuvre.h"
#import "Artwork.h"
#import "GDataXMLNode.h"

@implementation ArtworkParser
+(Oeuvre *)loadOeuvre:(NSString *)filePath
{
    NSURL *fileURL = [NSURL URLWithString:@"http://jackcreeksoftware.com/wp-includes/LearnToPaint/Oeuvre.xml"];
    
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfURL:fileURL];
//    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    NSError *error;
    
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
    if (!doc)
    {
        return nil;
    }
    
    Oeuvre *oeuvre = [[Oeuvre alloc] init];
    NSArray *combinationArtworks = [doc nodesForXPath:@"//Oeuvre/Artwork" error:nil];
    for(GDataXMLElement *combinationArtwork in combinationArtworks)
    {
        
        NSString *title = [[[combinationArtwork elementsForName:@"Title"] firstObject] stringValue];
        NSString *cost  = [[[combinationArtwork elementsForName:@"Price"] firstObject] stringValue];
        NSString *description = [[[combinationArtwork elementsForName:@"Detail"] firstObject] stringValue];
        
        NSString *partialURL = [[[combinationArtwork elementsForName:@"ImageFile"] firstObject] stringValue];
        NSURL *imageURL = [NSURL URLWithString:[@"http://jackcreeksoftware.com/wp-includes/LearnToPaint/" stringByAppendingString:partialURL]];
        
        Artwork *artwork = [[Artwork alloc] initWithTitle:title Cost:cost Detail:description imageURL:imageURL];
        [oeuvre.artworks addObject:artwork];
        
        
        
        
    }
    return oeuvre;
}

@end
